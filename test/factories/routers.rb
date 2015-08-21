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
    start_minutes [100,500,500] #每天的时间段区间
    end_minutes [1200,1400,1400]
    start_day 1  #星期日期区间
    end_day  5
    start_month  1  #月份区间
    end_month    8
    time_count  2 #代表有几个时间段
  end
end
