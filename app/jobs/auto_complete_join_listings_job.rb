class AutoCompleteJoinListingsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    HostListingToJoinListing.where('invitation_sent_time < ?', DateTime.now - 15.minutes).each do |h|
      h.update(completed: true)
    end
  end
end
