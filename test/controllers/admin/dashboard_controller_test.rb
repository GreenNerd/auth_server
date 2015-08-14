require 'test_helper'

class Admin::DashboardControllerTest < ActionController::TestCase
  test "should redirect if no admin" do
    get :show
    assert_redirected_to admin_login_url
  end

  test "should get show page" do
    login_as create(:admin)
    get :show
    assert_response :success, @response.body
  end
end
