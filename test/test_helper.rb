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
  Allowed = 'Auth: 1'
  Denied = 'Auth: 0'

  %w(wifi_auth_url token_for login_as).each do |method|
    define_method method do |*args|
      @controller.send method, *args
    end
  end
end
