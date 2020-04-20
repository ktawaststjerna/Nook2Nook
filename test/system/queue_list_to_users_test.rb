require "application_system_test_case"

class QueueListToUsersTest < ApplicationSystemTestCase
  setup do
    @queue_list_to_user = queue_list_to_users(:one)
  end

  test "visiting the index" do
    visit queue_list_to_users_url
    assert_selector "h1", text: "Queue List To Users"
  end

  test "creating a Queue list to user" do
    visit queue_list_to_users_url
    click_on "New Queue List To User"

    fill_in "Queue", with: @queue_list_to_user.queue_id
    fill_in "User", with: @queue_list_to_user.user_id
    click_on "Create Queue list to user"

    assert_text "Queue list to user was successfully created"
    click_on "Back"
  end

  test "updating a Queue list to user" do
    visit queue_list_to_users_url
    click_on "Edit", match: :first

    fill_in "Queue", with: @queue_list_to_user.queue_id
    fill_in "User", with: @queue_list_to_user.user_id
    click_on "Update Queue list to user"

    assert_text "Queue list to user was successfully updated"
    click_on "Back"
  end

  test "destroying a Queue list to user" do
    visit queue_list_to_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Queue list to user was successfully destroyed"
  end
end
