require 'test_helper'

class OutputsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get outputs_new_url
    assert_response :success
  end

  test 'should get create' do
    get outputs_create_url
    assert_response :success
  end

  test 'should get edit' do
    get outputs_edit_url
    assert_response :success
  end

  test 'should get update' do
    get outputs_update_url
    assert_response :success
  end
end
