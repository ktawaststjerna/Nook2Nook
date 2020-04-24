class EnqueueListingJob < ApplicationJob
  queue_as :default

  def perform(*args)
    join_listing = args[0]
    return if join_listing.max_host_listings?

    # Only listings that are not hosting should get in
    if join_listing.selling
      HostListing.buying.active.where(amount: join_listing.amount_min..join_listing.amount_max).each do |host_listing|
        return if join_listing.max_host_listings?
        return if host_listing.full?
        host_listing&.enqueue(join_listing)
      end
    else
      HostListing.selling.active.where(amount: join_listing.amount_min..join_listing.amount_max).each do |host_listing|
        return if join_listing.max_host_listings?
        host_listing&.enqueue(join_listing)
      end
    end
  end
end
