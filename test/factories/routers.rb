# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :router do
    gw_id "MyString"
    sys_uptime 1
    sys_memfree 1
    sys_load "MyString"
    wifidog_uptime 1
    sync_time "2015-08-12 16:06:49"
    admin_ids []
  end
end
