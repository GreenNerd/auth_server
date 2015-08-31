class AddSigninConfToRouters < ActiveRecord::Migration
  def change
    add_column :routers, :signin_conf, :string, default: "{\"time_intervals\":[[0,1440]],\"wday_interval\":[1,2,3,4,5,6,7],\"month_interval\":[1,2,3,4,5,6,7,8,9,10,11,12]}"
  end
end
