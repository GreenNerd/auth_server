class Attendance < ActiveRecord::Base
   belongs_to :user
   before_create :check_time,:check_weekday,:check_month

private
  def  check_time
       router = self.user.router
      debugger
       start_minutes = router.set_time.time[0].start_minutes
       end_minutes = router.set_time.time[0].end_minutes
       time_count = router.set_time.time[0].start_minutes.length-1
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

   def check_weekdayt
        router = self.user.router
        start_day = router.set_time.time[0].start_day
        end_day = router.set_time.time[0].end_day
    #需要传入start_day和end_day
        a = Time.now
        day_num = a.wday
        compare_num(start_day,end_day,day_num)
    end

    def check_month
        router = self.user.router
        start_month = router.set_time.time[0].start_month
        end_month = router.set_time.time[0].end_month
     #需要传入start_month和end_moth
        m = Time.now.to_a
        month_num = m[4]
        compare_num(start_month,end_month,month_num)
    end

  end