class UserController < ApplicationController
  def auth
    case params[:stage]
    when 'login'
      name = get_name_from_token(params[:token], 7)
      user = User.find_by(name: name)
      if user && params[:mac]
        bind_or_deny(user, params[:mac])
      else
        render Denied
      end
    else
      render Allowed
    end
  end

  private

  Allowed = {plain: 'Auth: 1'}
  Denied = {plain: 'Auth: 0'}

  def bind_or_deny(user, mac_addr)
    case user.mac_addr
    when nil
      user.mac_addr = mac_addr
      if user.save
        user.attendances.create
        render Allowed
      else
        render Denied
      end
    when mac_addr
      user.attendances.create
      render Allowed
    else
      render Denied
    end
  end
end
