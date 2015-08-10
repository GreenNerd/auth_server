class SessionsController < ApplicationController
  def new
    session.merge!(params.slice(:gw_address, :gw_port, :gw_id, :url))
  end
end
