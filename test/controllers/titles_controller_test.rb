require 'test_helper'

class TitlesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get titles_new_url
    assert_response :success
  end

  test "should get create" do
    get titles_create_url
    assert_response :success
  end

  test "should get index" do
    get titles_index_url
    assert_response :success
  end

end
