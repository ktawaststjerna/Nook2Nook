class HostListingToJoinListing < ApplicationRecord
  belongs_to :host_listing
  belongs_to :join_listing

  scope :completed, -> { where(completed: true) }
  scope :not_completed, -> { where(completed: [nil, false]) }
  scope :invitation_sent, -> { where.not(invitation_sent_time: nil) }
  scope :waiting_in_queue, -> { where(invitation_sent_time: nil).where(completed: [nil, false]) }
end