require "test_helper"

class TournamentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tournaments_new_url
    assert_response :success
  end

  test "should get create" do
    get tournaments_create_url
    assert_response :success
  end
end
