class DashboardController < ApplicationController

  def dashboard
    @host_listings = HostListing.all
  end
end
