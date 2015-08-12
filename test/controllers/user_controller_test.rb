require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should bind user for first login" do
    user = create(:user, user_param('name', nil))
    get :auth, auth_param(user, 'foo')
    user.reload
    assert_equal 'foo', user.mac_addr
    assert_equal Allowed, @response.body
  end

  test "should return Allowed for user with correct mac_addr" do
    user = create(:user, user_param('name', 'foo'))
    get :auth, auth_param(user, 'foo')
    assert_equal Allowed, @response.body
  end

  test "should return Denied for user with wrong mac_addr" do
    user = create(:user, user_param('name', 'foo'))
    get :auth, auth_param(user, 'bar')
    assert_equal Denied, @response.body
  end

  test "should return Denied for user with mac_addr used" do
    user_a = create(:user, user_param('name_a', 'foo'))
    user_b = create(:user, user_param('name_b', nil))
    get :auth, auth_param(user_b, 'foo')
    assert_equal Denied, @response.body
  end

  test "should sign in for first login" do
    user = create(:user, user_param('name', nil))

    assert_difference "user.attendances.count" do
      get :auth, auth_param(user, 'foo')
    end
  end

  test "should sign in for user with correct mac_addr" do
    user = create(:user, user_param('name', 'foo'))

    assert_difference "user.attendances.count" do
      get :auth, auth_param(user, 'foo')
    end
  end

  def user_param(name, mac_addr)
    {name: name, password: '12345678', mac_addr: mac_addr}
  end

  def auth_param(user, mac_addr)
    token = token_for(user, 7)
    {stage: 'login', token: token, mac: mac_addr}
  end
end
