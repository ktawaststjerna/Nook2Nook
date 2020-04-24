class AutoCompleteJoinListingsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    HostListingToJoinListing.where('invitation_sent_time < ?', DateTime.now - 15.minutes).each do |h|
      h.update(completed: true)
      h.mass_allow_onto_island
    end
  end
end
