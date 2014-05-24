require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get csadmin" do
    get :csadmin
    assert_response :success
  end

end
