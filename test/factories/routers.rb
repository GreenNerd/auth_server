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
    signin_conf "{\"time_intervals\":[[0,1440]],\"day_interval\":[1,2,3,4,5,6,7],\"month_interval\":[1,2,3,4,5,6,7,8,9,10,11,12]}"
  end
end
