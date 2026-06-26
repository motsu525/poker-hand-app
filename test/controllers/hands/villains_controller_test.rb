require "test_helper"

class Hands::VillainsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get hands_villains_new_url
    assert_response :success
  end

  test "should get create" do
    get hands_villains_create_url
    assert_response :success
  end
end
