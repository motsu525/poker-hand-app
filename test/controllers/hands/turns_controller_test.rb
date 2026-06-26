require "test_helper"

class Hands::TurnsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get hands_turns_new_url
    assert_response :success
  end

  test "should get create" do
    get hands_turns_create_url
    assert_response :success
  end
end
