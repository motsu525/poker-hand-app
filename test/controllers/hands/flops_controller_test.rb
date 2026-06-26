require "test_helper"

class Hands::FlopsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get hands_flops_new_url
    assert_response :success
  end

  test "should get create" do
    get hands_flops_create_url
    assert_response :success
  end
end
