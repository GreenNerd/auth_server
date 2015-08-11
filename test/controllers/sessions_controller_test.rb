require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get login page" do
    get :new
    assert_response :success, @response.body
  end

  test "should store information" do
    get :new, gw_address: '199.199.199.199', gw_port: '2060', gw_id: '123', url: 'z.cn'
    %w(gw_address gw_port gw_id url).each do |param|
      assert_not_nil session[param.to_sym]
    end
  end

  test "should redirect with token after login" do
    session[:gw_address] = '199.199.199.199'
    session[:gw_port] = '2060'
    user = create(:user, name: 'name', password: '12345678')
    post :create, user: { name: 'name', password: '12345678' }
    token = token_for(user, 7)
    assert_redirected_to wifi_auth_url(session[:gw_address], session[:gw_port], token)
  end
end
