class AutoCompleteJoinListingsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    HostListingToJoinListing.where('invitation_sent_time < ?', DateTime.now - 15.minutes).each do |host_listing_to_join_listing|
      host_listing_to_join_listing.update(completed: true)
      host_listing_to_join_listing.host_listing.mass_allow_onto_island
    end
  end
end
