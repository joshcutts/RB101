# after_midnight.rb

=begin

The time of day can be represented as the number of minutes before or after midnight. 
If the number of minutes is positive, the time is after midnight. 
If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format 
and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

=end

# if minutes are less than 60 do operation direct
#   if negative subtract from 24:00, if positive add to 00:00
# if minutes are less than 1 full 24 hr day (1440 minutes) 
#   convert to minutes and seconds using divmod and add directly to 24:00 or 00:00 depending if integer is neg or pos
# if minutes are greater than 1 full 24 hr day (1440 minutes)
#   convert to minutes and seconds using divmod
#   remove 24 hrs at a time until number is less than 24 (use while loop)
#   either subtract from 24:00 if negative or add to 00:00 if positive minutes

def time_of_day(minutes)
  if minutes.abs() < 60
    minutes >= 0 ? "00:#{"%02d" % minutes}" : "23:#{"%02d" % (60 + minutes).to_s}"
  elsif minutes.abs() < 1440
    hours, remaining_minutes = minutes.divmod(60)
    minutes >= 0 ? "#{"%02d" % hours}:#{"%02d" % remaining_minutes}" : "#{"%02d" % (24 + hours).to_s}:#{"%02d" % remaining_minutes}"
  else
    hours, remaining_minutes = minutes.divmod(60)
    while hours > 24 || hours < -24
      hours > 24 ? hours -= 24 : hours += 24
    end
    minutes >= 0 ? "#{"%02d" % hours}:#{"%02d" % remaining_minutes}" : "#{"%02d" % (24 + hours).to_s}:#{"%02d" % remaining_minutes}"
  end
end

# p 125.divmod(60)
# p 3000.divmod(60)
# p 60 * 24
# p -1437.divmod(60)
# p "%02d" % 12
# hours, remaining_minutes = -1437.divmod(60)
# p hours, remaining_minutes

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"

p -1437 + 1440
p -3 + 1440
p 1437.divmod(60)

# further exploration

require 'time'

MIDNIGHT = Time.parse("00:00")
test = MIDNIGHT + 60
p MIDNIGHT.strftime("%R")
p test.strftime("%R")

p (Time.parse("12:34") - MIDNIGHT) / 60