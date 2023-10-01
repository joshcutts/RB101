# cute_angles.rb

=begin

Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a 
String that represents that angle in degrees, minutes and seconds. 
You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, 
and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

EXAMPLES

dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

=end



DEGREE = "\xC2\xB0"
MINUTES_IN_DEGREE = 60
SECONDS_IN_MINUTE = 60
require 'bigdecimal'

def dms(float_num)
  while float_num < -360 || float_num > 360
    if float_num < -360
      float_num += 360
    elsif float_num > 360
      float_num -= 360
    end
  end

  if float_num < 0
    float_num += 360
  end

  degrees = float_num.to_i
  decimal_remainder = BigDecimal(float_num).divmod(1)[1]

  minutes_and_remainder = decimal_remainder * 60
  minutes = minutes_and_remainder.floor

  seconds_decimal = minutes_and_remainder.divmod(1)[1] * 60
  seconds = minutes_and_remainder.floor
  
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")


