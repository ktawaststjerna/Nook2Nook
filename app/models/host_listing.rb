class HostListing < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many :host_listing_to_join_listings
  has_many :join_listings, through: :host_listing_to_join_listings

  # TODO: 12 hour maximum

  # before_save :duplicate_listings?
  before_save :time_limit_check

  validates :user_id, :item_id, :dodo_code, :amount, :start_date, :end_date, :max_users, :allowed_users, presence: true
  validates :selling, inclusion: { in: [true, false] }

  scope :selling, -> { where(selling: true) }
  scope :buying, -> { where(selling: false) }
  scope :active, -> { where('start_date <= ? AND end_date >= ?', DateTime.now, DateTime.now) }

  def self.host_listing_hash_based_on_number_of_queue(amount_min, amount_max, item_id)
    # # Sort by amount of joinable listings in queue, lowest amount first, largest last
    select("host_listings.id, host_listings.user_id, host_listings.allowed_users, host_listings.start_date, host_listings.end_date, host_listings.max_users, count(join_listings.id) AS join_listings_count").
      left_joins(:join_listings).
      group("host_listings.id").
      order("join_listings_count ASC").
      where(amount: amount_min..amount_max, item_id: item_id)
  end

  def time_limit_check
    twelve_hours_in_seconds = 43210 # Slight padding on seconds just incase there's a delay inbetween start and end date on creating...
    raise 'Host Listing cannot be longer then 12 hours' if end_date.ago(twelve_hours_in_seconds) > start_date
  end

  def duplicate_listings?
    raise "User already has Host Listing with Item #{item.name}" if user.host_listings.pluck(:item_id).include?(item_id)
  end

  def complete_join_listing(join_listing_id)
    HostListingToJoinListing.find_by(host_listing_id: id, join_listing_id: join_listing_id).update(completed: true)
  end

  def full?
    HostListingToJoinListing.where(host_listing_id: id, join_listing_id: join_listings.pluck(:id), completed: [nil,false]).count >= max_users
  end

  def completed_join_listings
    join_listings.where(id: host_listing_to_join_listings.completed.invitation_sent.pluck(:join_listing_id))
  end

  def total_join_listings_in_queue
    join_listings.where(id: host_listing_to_join_listings.not_completed.pluck(:join_listing_id))
  end

  def currently_on_island
    join_listings.where(id: host_listing_to_join_listings.not_completed.invitation_sent.pluck(:join_listing_id))
  end

  def waiting_to_get_on_island
    join_listings.where(id: host_listing_to_join_listings.waiting_in_queue.pluck(:join_listing_id))
  end

  def allowed_join_listings
    join_listing_ids = host_listing_to_join_listings.not_completed.limit(allowed_users).pluck(:join_listing_id)
    join_listings.where(id: join_listing_ids)
  end

  def mass_allow_onto_island
    allowed_join_listings.each do |join_listing|
      allow_onto_island(join_listing) if HostListingToJoinListing.find_by(host_listing_id: id, join_listing_id: join_listing.id).invitation_sent_time.nil?
    end
  end

  def allow_onto_island(join_listing)
    # Maybe Check if allowed join listings size
    # Set time on hostlistingtimelisting
    if HostListingToJoinListing.find_by(host_listing_id: id, join_listing_id: join_listing.id).update!(invitation_sent_time: DateTime.now)
      CreateNotificationJob.perform_later(join_listing.user_id, self.dodo_code)
    end
  end

  def enqueue(join_listing)
    return if join_listings.include?(join_listing)
    return if join_listing.user == user
    return if join_listings.size >= max_users
    return if join_listings.pluck(:user_id).include?(join_listing.user.id)
    return if DateTime.now < start_date || DateTime.now > end_date

    host_listing_to_join_listing = HostListingToJoinListing.create!(host_listing_id: id, join_listing_id: join_listing.id)
    allow_onto_island(join_listing) if allowed_join_listings.include?(join_listing)
  end

  def remove_from_queue(join_listing)
    host_listing_to_join_listings.where(join_listing_id: join_listing).destroy
  end

  def remove_oldest_from_queue
    # First is oldest, last is newest. Remove first as it's the oldest
    host_listing_to_join_listings.first.destroy
  end
end
