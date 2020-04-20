require 'test_helper'

class QueueListToUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @queue_list_to_user = queue_list_to_users(:one)
  end

  test "should get index" do
    get queue_list_to_users_url
    assert_response :success
  end

  test "should get new" do
    get new_queue_list_to_user_url
    assert_response :success
  end

  test "should create queue_list_to_user" do
    assert_difference('QueueListToUser.count') do
      post queue_list_to_users_url, params: { queue_list_to_user: { queue_id: @queue_list_to_user.queue_id, user_id: @queue_list_to_user.user_id } }
    end

    assert_redirected_to queue_list_to_user_url(QueueListToUser.last)
  end

  test "should show queue_list_to_user" do
    get queue_list_to_user_url(@queue_list_to_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_queue_list_to_user_url(@queue_list_to_user)
    assert_response :success
  end

  test "should update queue_list_to_user" do
    patch queue_list_to_user_url(@queue_list_to_user), params: { queue_list_to_user: { queue_id: @queue_list_to_user.queue_id, user_id: @queue_list_to_user.user_id } }
    assert_redirected_to queue_list_to_user_url(@queue_list_to_user)
  end

  test "should destroy queue_list_to_user" do
    assert_difference('QueueListToUser.count', -1) do
      delete queue_list_to_user_url(@queue_list_to_user)
    end

    assert_redirected_to queue_list_to_users_url
  end
end
