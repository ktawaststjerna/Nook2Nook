require 'test_helper'

class JoinListingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @join_listing = join_listings(:one)
  end

  test "should get index" do
    get join_listings_url
    assert_response :success
  end

  test "should get new" do
    get new_join_listing_url
    assert_response :success
  end

  test "should create join_listing" do
    assert_difference('JoinListing.count') do
      post join_listings_url, params: { join_listing: { amount_max: @join_listing.amount_max, amount_min: @join_listing.amount_min, end_date: @join_listing.end_date, item_id: @join_listing.item_id, selling: @join_listing.selling, start_date: @join_listing.start_date, user_id: @join_listing.user_id } }
    end

    assert_redirected_to join_listing_url(JoinListing.last)
  end

  test "should show join_listing" do
    get join_listing_url(@join_listing)
    assert_response :success
  end

  test "should get edit" do
    get edit_join_listing_url(@join_listing)
    assert_response :success
  end

  test "should update join_listing" do
    patch join_listing_url(@join_listing), params: { join_listing: { amount_max: @join_listing.amount_max, amount_min: @join_listing.amount_min, end_date: @join_listing.end_date, item_id: @join_listing.item_id, selling: @join_listing.selling, start_date: @join_listing.start_date, user_id: @join_listing.user_id } }
    assert_redirected_to join_listing_url(@join_listing)
  end

  test "should destroy join_listing" do
    assert_difference('JoinListing.count', -1) do
      delete join_listing_url(@join_listing)
    end

    assert_redirected_to join_listings_url
  end
end
