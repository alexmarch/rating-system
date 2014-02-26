require 'test_helper'

class RatingsControllerTest < ActionController::TestCase
  test "should get score" do
    get :score
    assert_response :success
  end

end
