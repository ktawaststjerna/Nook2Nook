class HostListingToJoinListing < ApplicationRecord
  belongs_to :host_listing
  belongs_to :join_listing
end
