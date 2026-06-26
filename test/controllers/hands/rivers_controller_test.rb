require "test_helper"

class Hands::RiversControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get hands_rivers_new_url
    assert_response :success
  end

  test "should get create" do
    get hands_rivers_create_url
    assert_response :success
  end
end
