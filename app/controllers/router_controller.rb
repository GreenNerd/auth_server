class RouterController < ApplicationController
  def message
    flash[:now] = params[:message]
  end

  def ping
    router = Router.find_by(gw_id: params[:gw_id])
    router_params = params.slice(:sys_uptime, :sys_load, :sys_memfree, :wifidog_uptime).symbolize_keys
    router.update(router_params)
    render plain: 'Pong'
  end

  def portal
  end
end
