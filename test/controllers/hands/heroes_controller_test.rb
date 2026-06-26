require "test_helper"

class Hands::HeroesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get hands_heroes_new_url
    assert_response :success
  end

  test "should get create" do
    get hands_heroes_create_url
    assert_response :success
  end
end
