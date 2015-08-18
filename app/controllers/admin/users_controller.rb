class Admin::UsersController < Admin::ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = @router.users
  end

  def new
    @user = User.new
  end

  def create
    if @router.users.create(user_params.slice(:name, :password))
      redirect_to admin_user_url(@router.users.last)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to admin_user_url(@user)
  end

  def destroy
    @user.destroy
    redirect_to admin_users_url
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :mac_addr)
  end
end
