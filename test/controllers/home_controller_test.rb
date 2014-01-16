require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get nearme" do
    get :nearme
    assert_response :success
  end

end
