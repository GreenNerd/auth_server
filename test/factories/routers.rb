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
    test_data={:start_minutes=>[600,600,600],
                          :end_minutes=>[1400,1400,1400],
                          :start_day=>1,
                          :end_day=>5,
                          :start_month=>1,
                          :end_month=>9}
    time_to_s=JSON.generate(test_data)
    signin_conf  time_to_s
     
  end
end

