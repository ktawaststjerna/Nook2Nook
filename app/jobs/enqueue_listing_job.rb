class EnqueueListingJob < ApplicationJob
  queue_as :default

  def perform(*args)
    limit_of_listings = 10
    join_listing = args[0]

    return if join_listing.host_listings.count >= limit_of_listings

    # Only listings that are not hosting should get in
    if join_listing.selling
      HostListing.buying.active.each do |host_listing|
        host_listing&.enqueue(join_listing)
      end
    else
      HostListing.selling.active.each do |host_listing|
        host_listing&.enqueue(join_listing)
      end
    end
  end
end
