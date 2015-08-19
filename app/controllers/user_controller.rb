class UserController < ApplicationController
  def auth
    case params[:stage]
    when 'login'
      name = get_name_from_token(params[:token], 7)
      user = User.find_by(name: name)
      if user && params[:mac]
        bind_or_deny(user, params[:mac])
      else
        render plain: Auth_status[:denied]
      end
    else
      render plain: Auth_status[:allowed]
    end
  end

  def access
    user_mac_addr = params[:user_mac_addr]
    router_mac_addr = params[:router_mac_addr]

    unless user_mac_addr && router_mac_addr && Router.exists?(gw_id: router_mac_addr)
      return render plain: Bound_status(router_mac_addr, :params_error)
    end

    if User.exists?(
      router_id: Router.find_by(gw_id: router_mac_addr),
      mac_addr: user_mac_addr)
      render plain: Bound_status(router_mac_addr, :bound)
    else
      render plain: Bound_status(router_mac_addr, :unbound)
    end
  end

  private

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

  def bind_or_deny(user, mac_addr)
    case user.mac_addr
    when nil
      user.mac_addr = mac_addr
      if user.save
        user.attendances.create
        render plain: Auth_status[:allowed]
      else
        render plain: Auth_status[:denied]
      end
    when mac_addr
      user.attendances.create
      render plain: Auth_status[:allowed]
    else
      render plain: Auth_status[:denied]
    end
  end
end
