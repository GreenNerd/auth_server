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
    token_secret = 7
    token = 'name'.bytes.map { |byte| (byte^token_secret).chr }.join
    create(:user, name: 'name', password: '12345678')
    post :create, user: { name: 'name', password: '12345678' }
    assert_redirected_to "http://199.199.199.199:2060/wifidog/auth?token=#{token}"
  end
end
