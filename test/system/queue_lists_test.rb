require "application_system_test_case"

class QueueListsTest < ApplicationSystemTestCase
  setup do
    @queue_list = queue_lists(:one)
  end

  test "visiting the index" do
    visit queue_lists_url
    assert_selector "h1", text: "Queue Lists"
  end

  test "creating a Queue list" do
    visit queue_lists_url
    click_on "New Queue List"

    fill_in "Allowed users", with: @queue_list.allowed_users
    fill_in "End time", with: @queue_list.end_time
    fill_in "Max users", with: @queue_list.max_users
    fill_in "Start time", with: @queue_list.start_time
    click_on "Create Queue list"

    assert_text "Queue list was successfully created"
    click_on "Back"
  end

  test "updating a Queue list" do
    visit queue_lists_url
    click_on "Edit", match: :first

    fill_in "Allowed users", with: @queue_list.allowed_users
    fill_in "End time", with: @queue_list.end_time
    fill_in "Max users", with: @queue_list.max_users
    fill_in "Start time", with: @queue_list.start_time
    click_on "Update Queue list"

    assert_text "Queue list was successfully updated"
    click_on "Back"
  end

  test "destroying a Queue list" do
    visit queue_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Queue list was successfully destroyed"
  end
end
