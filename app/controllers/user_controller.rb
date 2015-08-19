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
  end

  private

  Auth_status = {
    allowed: 'Auth: 1',
    denied: 'Auth: 0'
  }

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
