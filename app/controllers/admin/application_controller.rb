class Admin::ApplicationController < ApplicationController
  before_action :login_required

  private

  def login_required
    unless session[:admin_id].present?
      redirect_to admin_login_url
    end
  end

  def login_as(user)
    session[:admin_id] = user.id
  end

  def logout
    session.delete(:admin_id)
  end
end
