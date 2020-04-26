require "application_system_test_case"

class HostListingsTest < ApplicationSystemTestCase
  setup do
    @host_listing = host_listings(:one)
  end

  test "visiting the index" do
    visit host_listings_url
    assert_selector "h1", text: "Host Listings"
  end

  test "creating a Host listing" do
    visit host_listings_url
    click_on "New Host Listing"

    fill_in "Allowed users", with: @host_listing.allowed_users
    fill_in "Amount", with: @host_listing.amount
    fill_in "End date", with: @host_listing.end_date
    fill_in "Item", with: @host_listing.item_id
    fill_in "Max users", with: @host_listing.max_users
    check "Selling" if @host_listing.selling
    fill_in "Start date", with: @host_listing.start_date
    fill_in "User", with: @host_listing.user_id
    click_on "Create Host listing"

    assert_text "Host listing was successfully created"
    click_on "Back"
  end

  test "updating a Host listing" do
    visit host_listings_url
    click_on "Edit", match: :first

    fill_in "Allowed users", with: @host_listing.allowed_users
    fill_in "Amount", with: @host_listing.amount
    fill_in "End date", with: @host_listing.end_date
    fill_in "Item", with: @host_listing.item_id
    fill_in "Max users", with: @host_listing.max_users
    check "Selling" if @host_listing.selling
    fill_in "Start date", with: @host_listing.start_date
    fill_in "User", with: @host_listing.user_id
    click_on "Update Host listing"

    assert_text "Host listing was successfully updated"
    click_on "Back"
  end

  test "destroying a Host listing" do
    visit host_listings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Host listing was successfully destroyed"
  end
end
