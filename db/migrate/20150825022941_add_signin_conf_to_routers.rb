class AddSigninConfToRouters < ActiveRecord::Migration
  def change
    add_column :routers, :signin_conf, :string
  end
end
