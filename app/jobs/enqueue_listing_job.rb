class EnqueueListingJob < ApplicationJob
  queue_as :default

  def perform(*args)
    join_listing = args[0]
    return if join_listing.max_host_listings?

    # Only listings that are not hosting should get in
    if join_listing.selling
      HostListing.host_listing_hash_based_on_number_of_queue(join_listing.amount_min, join_listing.amount_max, join_listing.item_id).selling.each do |host_listing|
        return if join_listing.max_host_listings?
        return if host_listing.full?

        host_listing&.enqueue(join_listing)
      end
    else
      HostListing.host_listing_hash_based_on_number_of_queue(join_listing.amount_min, join_listing.amount_max, join_listing.item_id).buying.each do |host_listing|
        return if join_listing.max_host_listings?
        return if host_listing.full?

        host_listing&.enqueue(join_listing)
      end
    end
  end
end
