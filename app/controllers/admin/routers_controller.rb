class Admin::RoutersController < Admin::ApplicationController
  before_action :find_router

  def show
  end

  def edit
  end

  def update
    if @router.update(router_params)
      redirect_to admin_router_url
    else
      render 'edit'
    end
  end

  private

  def find_router
    @router = Router.first
  end

  def router_params
    params.require(:router).permit(:name)
  end
end
