require 'test_helper'

class RouterControllerTest < ActionController::TestCase
  test "should get error message page" do
    get :message
    assert_response :success, @response.body
  end

  test "should update router info" do
    router = create(:router, gw_id: 'gwid')
    ping_params = { gw_id: 'gwid',
                    sys_uptime: 199512,
                    sys_memfree: 951213,
                    sys_load: '0.77',
                    wifidog_uptime: 121319 }

    get :ping, ping_params
    router.reload

    ping_params.each do |key,value|
      assert_equal value, router.attributes[key.to_s]
    end
  end

  test "should get success page" do
    get :portal
    assert_response :success, @response.body
  end
end
