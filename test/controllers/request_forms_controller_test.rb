require 'test_helper'

class RequestFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request_form = request_forms(:one)
  end

  test "should get index" do
    get request_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_request_form_url
    assert_response :success
  end

  test "should create request_form" do
    assert_difference('RequestForm.count') do
      post request_forms_url, params: { request_form: { email: @request_form.email, first_name: @request_form.first_name, last_name: @request_form.last_name, phone: @request_form.phone } }
    end

    assert_redirected_to request_form_url(RequestForm.last)
  end

  test "should show request_form" do
    get request_form_url(@request_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_request_form_url(@request_form)
    assert_response :success
  end

  test "should update request_form" do
    patch request_form_url(@request_form), params: { request_form: { email: @request_form.email, first_name: @request_form.first_name, last_name: @request_form.last_name, phone: @request_form.phone } }
    assert_redirected_to request_form_url(@request_form)
  end

  test "should destroy request_form" do
    assert_difference('RequestForm.count', -1) do
      delete request_form_url(@request_form)
    end

    assert_redirected_to request_forms_url
  end
end
