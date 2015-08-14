class AddNameToRouters < ActiveRecord::Migration
  def change
    add_column :routers, :name, :string
  end
end
