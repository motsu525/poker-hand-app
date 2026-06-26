require "test_helper"

class HandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hands_index_url
    assert_response :success
  end

  test "should get show" do
    get hands_show_url
    assert_response :success
  end
end
