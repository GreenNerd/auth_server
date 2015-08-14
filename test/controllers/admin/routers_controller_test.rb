require 'test_helper'

class Admin::RoutersControllerTest < ActionController::TestCase
  def setup
    @router = create(:router)
    login_as create(:admin)
  end

  test "should get show page" do
    get :show
    assert_response :success, @response.body
  end

  test "should edit router" do
    get :edit
    assert_response :success, @response.body
  end

  test "should update router" do
    xhr :patch, :update, router: { name: 'newrouter' }
    @router.reload
    assert_equal 'newrouter', @router.name
  end
end
