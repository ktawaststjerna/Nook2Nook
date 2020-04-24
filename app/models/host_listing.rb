class HostListing < ApplicationRecord
  belongs_to :user
  has_one :item
  has_many :host_listing_to_join_listings
  has_many :join_listings, through: :host_listing_to_join_listings

  scope :selling, -> { where(selling: true) }
  scope :buying, -> { where(selling: false) }
  scope :active, -> { where('start_date <= ? AND end_date >= ?', DateTime.now, DateTime.now) }

  def full?
    join_listings.count >= max_users
  end

  def allowed_join_listings
    # TODO: Create scheduled job to remove listings might need a archived boolean
    host_listing_to_join_listings.limit(4)
  end

  def enqueue(join_listing)
    return if join_listings.include?(join_listing)
    return if join_listing.user == user
    return if join_listings.size >= max_users
    return if DateTime.now < start_date || DateTime.now > end_date
    return if join_listings.include?(join_listing)

    HostListingToJoinListing.create!(host_listing_id: id, join_listing_id: join_listing.id)
  end

  def remove_from_queue(join_listing)
    host_listing_to_join_listings.where(join_listing_id: join_listing).destroy
  end

  def remove_oldest_from_queue
    # First is oldest, last is newest. Remove first as it's the oldest
    host_listing_to_join_listings.first.destroy
  end
end
