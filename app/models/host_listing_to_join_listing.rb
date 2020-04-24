class HostListingToJoinListing < ApplicationRecord
  belongs_to :host_listing
  belongs_to :join_listing

  scope :completed, -> { where(completed: true) }
  scope :not_completed, -> { where(completed: [nil, false]) }
end
