ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  include FactoryGirl::Syntax::Methods
end

class ActionController::TestCase
  Auth_status = {
    allowed: 'Auth: 1',
    denied: 'Auth: 0'
  }

  Bound_status = {
    bound: 'Bound: 1',
    unbound: 'Bound: 0',
    params_error: 'Bound: -1'
  }

  def Bound_status(router_mac_addr, status)
    "gw_id: #{router_mac_addr} Bound: #{Bound_status[status]}"
  end

  %w(wifi_auth_url token_for login_as logout find_router).each do |method|
    define_method method do |*args|
      @controller.send method, *args
    end
  end
end
