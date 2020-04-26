class EnqueueActiveListingsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    JoinListing.active.each do |join_listing|
      next if join_listing.max_host_listings?
      join_listing.join_host_listings
    end
  end
end
