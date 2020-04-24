class HostListing < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many :host_listing_to_join_listings
  has_many :join_listings, through: :host_listing_to_join_listings

  # TODO: 12 hour maximum

  before_save :duplicate_listings?

  scope :selling, -> { where(selling: true) }
  scope :buying, -> { where(selling: false) }
  scope :active, -> { where('start_date <= ? AND end_date >= ?', DateTime.now, DateTime.now) }

  def duplicate_listings?
    raise "User already has Join Listing with Item #{item.name}" if user.join_listings.pluck(:item_id).include?(item_id)
  end

  def complete_join_listing(join_listing_id)
    HostListingToJoinListing.find_by(host_listing_id: id, join_listing_id: join_listing_id).update(completed: true)
  end

  def full?
    HostListingToJoinListing.where(host_listing_id: id, join_listing_id: join_listings.pluck(:id), completed: [nil,false]).count >= max_users
  end

  def allowed_join_listings
    # TODO: Create scheduled job to remove listings might need a archived boolean
    host_listing_to_join_listings.not_completed.limit(allowed_users)
  end

  def enqueue(join_listing)
    return if join_listings.include?(join_listing)
    return if join_listing.user == user
    return if join_listings.size >= max_users
    return if join_listings.pluck(:user_id).include?(join_listing.user.id)
    return if DateTime.now < start_date || DateTime.now > end_date

    host_listing_to_join_listing = HostListingToJoinListing.create!(host_listing_id: id, join_listing_id: join_listing.id)
    allow_onto_island(join_listing.id) if allowed_join_listings < allowed_users
  end

  def allow_onto_island(join_listing_id)
    # Maybe Check if allowed join listings size
    # Set time on hostlistingtimelisting
    HostListingToJoinListing.find_by(host_listing_id: id, join_listing_id: join_listing_id).update(invitation_sent_time: DateTime.now)
  end

  def remove_from_queue(join_listing)
    host_listing_to_join_listings.where(join_listing_id: join_listing).destroy
  end

  def remove_oldest_from_queue
    # First is oldest, last is newest. Remove first as it's the oldest
    host_listing_to_join_listings.first.destroy
  end
end
