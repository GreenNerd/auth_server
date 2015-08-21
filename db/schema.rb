# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150821041957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attendances", ["user_id"], name: "index_attendances_on_user_id", using: :btree

  create_table "routers", force: :cascade do |t|
    t.string   "gw_id"
    t.integer  "sys_uptime"
    t.integer  "sys_memfree"
    t.string   "sys_load"
    t.integer  "wifidog_uptime"
    t.time     "sync_time"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "admin_ids",      default: [],              array: true
    t.string   "name"
    t.integer  "start_minutes",  default: [],              array: true
    t.integer  "end_minutes",    default: [],              array: true
    t.integer  "start_day"
    t.integer  "end_day"
    t.integer  "start_month"
    t.integer  "end_month"
    t.integer  "time_count"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "mac_addr"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "router_id"
  end

  add_foreign_key "attendances", "users"
end
