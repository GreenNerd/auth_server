require 'test_helper'

class Admin::SessionsControllerTest < ActionController::TestCase
  test "should get login page" do
    get :new
    assert_response :success, @response.body
  end

  test "should render new if no admin" do
    create(:user, name: 'name', password: '123456')
    post :create, user: { name: 'name', password: '123456' }
    assert_template 'new'
  end

  test "should redirect to dash page" do
    admin = create(:admin, name: 'admin', password: '123456')
    post :create, user: { name: 'admin', password: '123456' }
    assert_redirected_to admin_root_url
  end
end
