class JoinListing < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many :host_listing_to_join_listing
  has_many :host_listings, through: :host_listing_to_join_listing

  # before_save :duplicate_listings?
  before_save :time_limit_check

  validates :user_id, :item_id, :amount_min, :amount_max, :start_date, :end_date, presence: true
  validates :selling, inclusion: { in: [true, false] }

  scope :selling, -> { where(selling: true) }
  scope :buying, -> { where(selling: false) }
  scope :active, -> { where('start_date <= ? AND end_date >= ?', DateTime.now, DateTime.now) }

  def time_limit_check
    twelve_hours_in_seconds = 43210 # Slight padding on seconds just incase there's a delay inbetween start and end date on creating...
    raise 'Join Listing cannot be longer then 12 hours' if end_date.ago(twelve_hours_in_seconds) > start_date
  end

  def completed?(host_listing_id)
    host_listing_to_join_listings.find_by(host_listing_id: host_listing_id).completed?
  end

  def duplicate_listings?
    raise "User already has Join Listing with Item #{item.name}" if user.join_listings.pluck(:item_id).include?(item_id)
  end

  def max_host_listings?
    limit_of_listings = 3
    host_listings.count >= limit_of_listings
  end

  def join_host_listings
    return if max_host_listings?
    EnqueueListingJob.perform_later(self)
  end
end
