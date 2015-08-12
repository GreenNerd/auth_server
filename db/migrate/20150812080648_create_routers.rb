class CreateRouters < ActiveRecord::Migration
  def change
    create_table :routers do |t|
      t.string :gw_id
      t.integer :sys_uptime
      t.integer :sys_memfree
      t.string :sys_load
      t.integer :wifidog_uptime
      t.time :sync_time

      t.timestamps null: false
    end
  end
end
