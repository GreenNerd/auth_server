class Attendance < ActiveRecord::Base
   belongs_to :user
   before_create :check_time,:check_weekday,:check_month

private
  def  check_time
       set_time = self.user.router.signin_conf
       time_conf = JSON.parse(set_time)
       #debugger
       start_minutes =  time_conf["start_minutes"]
       end_minutes =  time_conf["end_minutes"]
       time_count = start_minutes.length-1
      #需要传入的参数
       result = true
       t = Time.new.to_a
       now_minutes  =  t[2]*60+t[1]
       #debugger
       (0..time_count).each do|c|
          if !compare_num(start_minutes[c],end_minutes[c],now_minutes)
            result = false
          end
       end
   return result
  end

  #比较时间段及星期以及月份的函数
  def compare_num(start_num,end_num,now_num)
       (start_num-1)<now_num && end_num>(now_num-1)  ? true : false
  end

   def check_weekday
        set_time = self.user.router.signin_conf
        time_conf = JSON.parse(set_time )
        start_day =  time_conf["start_day"]
        end_day =  time_conf["end_day"]
    #需要传入start_day和end_day
        a = Time.now
        day_num = a.wday
        compare_num(start_day,end_day,day_num)
    end

    def check_month
        set_time  = self.user.router.signin_conf
        time_conf = JSON.parse(set_time )
        start_month = time_conf["start_month"]
        end_month =  time_conf["end_month"]
     #需要传入start_month和end_moth
        m = Time.now.to_a
        month_num = m[4]
        compare_num(start_month,end_month,month_num)
    end

  end