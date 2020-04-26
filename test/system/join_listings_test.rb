require "application_system_test_case"

class JoinListingsTest < ApplicationSystemTestCase
  setup do
    @join_listing = join_listings(:one)
  end

  test "visiting the index" do
    visit join_listings_url
    assert_selector "h1", text: "Join Listings"
  end

  test "creating a Join listing" do
    visit join_listings_url
    click_on "New Join Listing"

    fill_in "Amount max", with: @join_listing.amount_max
    fill_in "Amount min", with: @join_listing.amount_min
    fill_in "End date", with: @join_listing.end_date
    fill_in "Item", with: @join_listing.item_id
    check "Selling" if @join_listing.selling
    fill_in "Start date", with: @join_listing.start_date
    fill_in "User", with: @join_listing.user_id
    click_on "Create Join listing"

    assert_text "Join listing was successfully created"
    click_on "Back"
  end

  test "updating a Join listing" do
    visit join_listings_url
    click_on "Edit", match: :first

    fill_in "Amount max", with: @join_listing.amount_max
    fill_in "Amount min", with: @join_listing.amount_min
    fill_in "End date", with: @join_listing.end_date
    fill_in "Item", with: @join_listing.item_id
    check "Selling" if @join_listing.selling
    fill_in "Start date", with: @join_listing.start_date
    fill_in "User", with: @join_listing.user_id
    click_on "Update Join listing"

    assert_text "Join listing was successfully updated"
    click_on "Back"
  end

  test "destroying a Join listing" do
    visit join_listings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Join listing was successfully destroyed"
  end
end
