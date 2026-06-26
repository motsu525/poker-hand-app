require "test_helper"

class Hands::PreflopsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get hands_preflops_new_url
    assert_response :success
  end

  test "should get create" do
    get hands_preflops_create_url
    assert_response :success
  end
end
