require 'test_helper'

class ComposeMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @compose_message = compose_messages(:one)
  end

  test "should get index" do
    get compose_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_compose_message_url
    assert_response :success
  end

  test "should create compose_message" do
    assert_difference('ComposeMessage.count') do
      post compose_messages_url, params: { compose_message: { message: @compose_message.message, recipient: @compose_message.recipient } }
    end

    assert_redirected_to compose_message_url(ComposeMessage.last)
  end

  test "should show compose_message" do
    get compose_message_url(@compose_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_compose_message_url(@compose_message)
    assert_response :success
  end

  test "should update compose_message" do
    patch compose_message_url(@compose_message), params: { compose_message: { message: @compose_message.message, recipient: @compose_message.recipient } }
    assert_redirected_to compose_message_url(@compose_message)
  end

  test "should destroy compose_message" do
    assert_difference('ComposeMessage.count', -1) do
      delete compose_message_url(@compose_message)
    end

    assert_redirected_to compose_messages_url
  end
end
