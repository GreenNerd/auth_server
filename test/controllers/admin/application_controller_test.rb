require 'test_helper'

class Admin::ApplicationControllerTest < ActionController::TestCase
  test "should find router" do
    login_as create(:admin)
    assert_not_nil find_router
  end
end
