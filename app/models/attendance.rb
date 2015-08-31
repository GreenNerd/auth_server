class Attendance < ActiveRecord::Base
  belongs_to :user

  before_create :check_time

  private

  def check_time
    time_now = Time.now.min + 60*Time.now.hour
    wday_now = Time.now.wday
    month_now = Time.now.mon
    time_intervals, wday_interval, month_interval = parse_signin_conf

    time_interval_include = false
    time_intervals.each do |time_interval|
      break if time_interval_include = (time_now > time_interval.first && time_now < time_interval.last)
    end

    time_interval_include && wday_interval.include?(wday_now) && month_interval.include?(month_now)
  end

  def parse_signin_conf
    router = self.user.router
    signin_conf = JSON.parse(router.signin_conf)
    [signin_conf["time_intervals"], signin_conf["wday_interval"], signin_conf["month_interval"]]
  end
end
