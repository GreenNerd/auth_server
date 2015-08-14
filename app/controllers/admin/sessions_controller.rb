class Admin::SessionsController < Admin::ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(name: login_params[:name])

    if @user && @user.authenticate(login_params[:password]) && @user.admin?
      login_as @user
      redirect_to admin_root_url
    else
      flash[:now] = '用户名或密码错误，或该用户非管理员'
      render :new
    end
  end

  def destroy
    logout
    redirect_to admin_login_url
  end

  private

  def login_params
    params.require(:user).permit(:name, :password)
  end
end
