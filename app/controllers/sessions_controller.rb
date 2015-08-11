class SessionsController < ApplicationController
  def new
    session.merge!(params.slice(:gw_address, :gw_port, :gw_id, :url))
  end

  def create
    @user = User.find_by(name: login_params[:name])

    if @user && @user.authenticate(login_params[:password])
      redirect_to wifi_auth_url(session[:gw_address], session[:gw_port])
    else
      flash[:now] = '用户名或密码错误，请重新登录'
      render :new
    end
  end

  private

  def login_params
    params.require(:user).permit(:name, :password)
  end
end
