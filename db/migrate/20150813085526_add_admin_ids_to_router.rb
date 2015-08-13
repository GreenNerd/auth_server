class AddAdminIdsToRouter < ActiveRecord::Migration
  def change
    add_column :routers, :admin_ids, :integer, array: true, default: []
  end
end
