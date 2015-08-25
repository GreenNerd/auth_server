class AddSetTimeToRouters < ActiveRecord::Migration
  def change
    add_column :routers, :set_time, :string
  end
end
