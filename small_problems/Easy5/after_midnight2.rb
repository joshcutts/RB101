# after_midnight2.rb

=begin

As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight. 
If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight, respectively. 
Both methods should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

=end

# 

# SECONDS_IN_MINUTE = 60
# MINUTES_IN_HOUR = 60

# def after_midnight(string_time)
#   hours_minutes = string_time.split(":")
#   hours = hours_minutes[0].to_i
#   minutes = hours_minutes[1].to_i
#   if hours == 24
#     0
#   else
#     minutes = (hours * 60) + minutes
#   end
# end

# def before_midnight(string_time)
#   hours_minutes = string_time.split(":")
#   hours = hours_minutes[0].to_i
#   minutes = hours_minutes[1].to_i
#   if hours == 24
#     0
#   else
#     minutes = (hours * 60) - (minutes)
#   end
# end



# further exploration with Time class

require 'time'

MIDNIGHT = Time.parse("00:00")
SECONDS_IN_MINUTE = 60
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def after_midnight(string_time)
  ((Time.parse(string_time) - MIDNIGHT) / SECONDS_IN_MINUTE) % MINUTES_PER_DAY
end

def before_midnight(string_time)
  (MINUTES_PER_DAY - after_midnight(string_time)) % MINUTES_PER_DAY
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
