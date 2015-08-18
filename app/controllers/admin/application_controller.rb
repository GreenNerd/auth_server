class Admin::ApplicationController < ApplicationController
  before_action :login_required
  before_action :find_router

  private

  def find_router
    @router = Router.first
  end

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
