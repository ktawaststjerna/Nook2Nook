require 'test_helper'

class QueueListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @queue_list = queue_lists(:one)
  end

  test "should get index" do
    get queue_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_queue_list_url
    assert_response :success
  end

  test "should create queue_list" do
    assert_difference('QueueList.count') do
      post queue_lists_url, params: { queue_list: { allowed_users: @queue_list.allowed_users, end_time: @queue_list.end_time, max_users: @queue_list.max_users, start_time: @queue_list.start_time } }
    end

    assert_redirected_to queue_list_url(QueueList.last)
  end

  test "should show queue_list" do
    get queue_list_url(@queue_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_queue_list_url(@queue_list)
    assert_response :success
  end

  test "should update queue_list" do
    patch queue_list_url(@queue_list), params: { queue_list: { allowed_users: @queue_list.allowed_users, end_time: @queue_list.end_time, max_users: @queue_list.max_users, start_time: @queue_list.start_time } }
    assert_redirected_to queue_list_url(@queue_list)
  end

  test "should destroy queue_list" do
    assert_difference('QueueList.count', -1) do
      delete queue_list_url(@queue_list)
    end

    assert_redirected_to queue_lists_url
  end
end
