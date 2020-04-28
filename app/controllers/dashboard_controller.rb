class DashboardController < ApplicationController

  def dashboard
    @host_listings = HostListing.active
  end
end
