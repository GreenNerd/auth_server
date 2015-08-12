class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def wifi_auth_url(gw_address, gw_port, token)
    "http://#{gw_address}:#{gw_port}/wifidog/auth?token=#{token}"
  end

  def token_for(user, token_secret)
    user.name.bytes.map { |byte| (byte^token_secret).chr }.join
  end

  def get_name_from_token(token, token_secret)
    token.bytes.map { |byte| (byte^token_secret).chr }.join
  end
end
