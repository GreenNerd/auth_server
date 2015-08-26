require 'test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
  def setup
    login_as create(:admin)
    @router = find_router
  end

  test "should get new page" do
    get :new
    assert_response :success, @response.body
  end

  test "should create user for the router" do
    assert_difference "@router.users.count" do
      xhr :post, :create, user: attributes_for(:user)
    end
  end

  test "should get index page" do
    get :index
    assert_response :success, @response.body
  end

  test "should get show page" do
    get :show, id: @router.users.create(attributes_for(:user))
    assert_response :success, @response.body
  end

  test "should edit user" do
    user = @router.users.create(attributes_for(:user))
    get :edit, id: user
    assert_response :success, @response.body
  end

  test "should update user" do
    user = @router.users.create(attributes_for(:user))
    patch :update, id: user, user: { name: 'wang', password: '654321', mac_addr: 'another' }
    user.reload
    assert_equal 'wang', user.name
    assert_equal 'another', user.mac_addr
    assert user.authenticate('654321')
  end

  test "should delete user" do
    user = @router.users.create(attributes_for(:user))
    assert_difference "@router.users.count", -1 do
      delete :destroy, id: user
    end
  end
end
