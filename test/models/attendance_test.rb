require 'test_helper'

class AttendanceTest < ActiveSupport::TestCase
  def setup
    @router = Router.create(attributes_for(:router))
    @user = @router.users.create(attributes_for(:user))
  end

  test "should sign in in the interval" do
    time_now = Time.now.min + 60*Time.now.hour
    wday_now = Time.now.wday
    month_now = Time.now.month

    time_intervals = [[time_now-60, time_now+60]]
    wday_interval = [wday_now]
    month_interval = [month_now]
    @router.set_signin_conf time_intervals: time_intervals,
                            wday_interval: wday_interval,
                            month_interval: month_interval

    assert_difference '@user.attendances.count' do
      @user.attendances.create
    end
  end

  test "should not sign in out of time interval" do
    time_now = Time.now.min + 60*Time.now.hour
    time_intervals = [[time_now-60, time_now-30]]
    @router.set_signin_conf time_intervals: time_intervals

    assert_no_difference '@user.attendances.count' do
      @user.attendances.create
    end
  end

  test "should not sign in out of wday interval" do
    wday_now = Time.now.wday
    wday_interval = (1..7).to_a.pop(wday_now-1)
    @router.set_signin_conf wday_interval: wday_interval

    assert_no_difference '@user.attendances.count' do
      @user.attendances.create
    end
  end

  test "should not sign in out of month interval" do
    month_now = Time.now.month
    month_interval = (1..12).to_a.pop(month_now-1)
    @router.set_signin_conf month_interval: month_interval

    assert_difference '@user.attendances.count' do
      @user.attendances.create
    end
  end
end
