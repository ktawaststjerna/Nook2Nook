require 'test_helper'

class HostListingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @host_listing = host_listings(:one)
  end

  test "should get index" do
    get host_listings_url
    assert_response :success
  end

  test "should get new" do
    get new_host_listing_url
    assert_response :success
  end

  test "should create host_listing" do
    assert_difference('HostListing.count') do
      post host_listings_url, params: { host_listing: { allowed_users: @host_listing.allowed_users, amount: @host_listing.amount, end_date: @host_listing.end_date, item_id: @host_listing.item_id, max_users: @host_listing.max_users, selling: @host_listing.selling, start_date: @host_listing.start_date, user_id: @host_listing.user_id } }
    end

    assert_redirected_to host_listing_url(HostListing.last)
  end

  test "should show host_listing" do
    get host_listing_url(@host_listing)
    assert_response :success
  end

  test "should get edit" do
    get edit_host_listing_url(@host_listing)
    assert_response :success
  end

  test "should update host_listing" do
    patch host_listing_url(@host_listing), params: { host_listing: { allowed_users: @host_listing.allowed_users, amount: @host_listing.amount, end_date: @host_listing.end_date, item_id: @host_listing.item_id, max_users: @host_listing.max_users, selling: @host_listing.selling, start_date: @host_listing.start_date, user_id: @host_listing.user_id } }
    assert_redirected_to host_listing_url(@host_listing)
  end

  test "should destroy host_listing" do
    assert_difference('HostListing.count', -1) do
      delete host_listing_url(@host_listing)
    end

    assert_redirected_to host_listings_url
  end
end
