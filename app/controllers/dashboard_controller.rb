class DashboardController < ApplicationController

  def dashboard
    @host_listings = HostListing.active.limit(10)
  end
end
