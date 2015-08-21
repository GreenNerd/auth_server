class AddTimeToRouters < ActiveRecord::Migration
  def change
    add_column :routers, :start_minutes,  :integer, array: true, default: []
    add_column :routers, :end_minutes,  :integer, array: true, default: []
  end
end
