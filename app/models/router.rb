class Router < ActiveRecord::Base
  has_many :users

  def set_signin_conf(signin_conf = {
                      time_intervals: [[0, 1440]],
                      wday_interval: (1..7).to_a,
                      month_interval: (1..12).to_a})
    signin_conf_orig = JSON.parse self.signin_conf
    signin_conf.each do |key, value|
      signin_conf_orig[key.to_s] = value if signin_conf_orig[key.to_s]
    end
    self.signin_conf = JSON.generate signin_conf_orig
  end
end
