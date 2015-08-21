class AddChecktimeToRouters < ActiveRecord::Migration
  def change
    add_column :routers, :start_minutes,  :integer, array: true, default: []
    add_column :routers, :end_minutes,  :integer, array: true, default: []
    add_column :routers, :start_day, :integer
    add_column :routers, :end_day, :integer
    add_column :routers, :start_month, :integer
    add_column :routers, :end_month, :integer
    add_column :routers, :time_count, :integer
  end
end
