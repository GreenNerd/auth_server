class AddRouterIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :router_id, :integer
  end
end
