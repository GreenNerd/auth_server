require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should bind user for first login" do
    user = create(:user, user_param('name', nil))
    get :auth, auth_param(user, 'foo')
    user.reload
    assert_equal 'foo', user.mac_addr
    assert_equal Auth_status[:allowed], @response.body
  end

  test "should return Allowed for user with correct mac_addr" do
    user = create(:user, user_param('name', 'foo'))
    get :auth, auth_param(user, 'foo')
    assert_equal Auth_status[:allowed], @response.body
  end

  test "should return Denied for user with wrong mac_addr" do
    user = create(:user, user_param('name', 'foo'))
    get :auth, auth_param(user, 'bar')
    assert_equal Auth_status[:denied], @response.body
  end

  test "should return Denied for user with mac_addr used" do
    user_a = create(:user, user_param('name_a', 'foo'))
    user_b = create(:user, user_param('name_b', nil))
    get :auth, auth_param(user_b, 'foo')
    assert_equal Auth_status[:denied], @response.body
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

  test "should return Bound" do
    router = create(:router)
    user = router.users.create(attributes_for(:user))

    get :access, access_param(user, router)
    assert_equal Bound_status[:bound], @response.body
  end

  test "should return Unbound" do
    router = create(:router)
    user = router.users.create(attributes_for(:user))

    get :access, user_mac_addr: 'notexist', router_mac_addr: router.gw_id
    assert_equal Bound_status[:unbound], @response.body
  end

  def user_param(name, mac_addr)
    {name: name, password: '12345678', mac_addr: mac_addr}
  end

  def auth_param(user, mac_addr)
    token = token_for(user, 7)
    {stage: 'login', token: token, mac: mac_addr}
  end

  def access_param(user, router)
    {user_mac_addr: user.mac_addr, router_mac_addr: router.gw_id}
  end
end
