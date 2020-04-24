class JoinListing < ApplicationRecord
  belongs_to :user
  has_one :item
  has_many :host_listing_to_join_listing
  has_many :host_listings, through: :host_listing_to_join_listing

  scope :selling, -> { where(selling: true) }
  scope :buying, -> { where(selling: false) }
  scope :active, -> { where('start_date <= ? AND end_date >= ?', DateTime.now, DateTime.now) }

  def max_host_listings?
    limit_of_listings = 3
    host_listings.count >= limit_of_listings
  end

  def join_host_listings
    return if max_host_listings?
    EnqueueListingJob.perform_later(self)
  end
end
