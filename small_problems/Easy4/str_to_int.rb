# str_to_int.rb

=begin 

The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) 
to an Integer. String#to_i and the Integer constructor (Integer()) behave similarly. 
In this exercise, you will create a method that does the same thing.

Write a method that takes a String of digits, and returns the appropriate number as an integer. 
You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume 
all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby to convert a string to a number, 
such as String#to_i, Integer(), etc. Your method should do this the old-fashioned way and calculate 
the result by analyzing the characters in the string.

string_to_integer('4321') == 4321
string_to_integer('570') == 570

=end

# use a list to hold integer values
# use case statement and step through the str number one character at a time
# when the case equals a certain str number push that value to an array
# return the string at the end

# def string_to_integer(str)
#   numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  
#   str.each_char do |char|
#     case(char)
#     when char == "1"
      
# end



# try to create program that adds everything together based on position of number in the string
# get the length of the string - once you know this you will be able to add the final values
# create a multiplier that is the value of the length of the string - for example a str that is 3 digits long should have a multiplier with value 100
# create an empty sum
# step through str one digit at time, use conversion hash to return actual integer number then multiply it by the multiplier
# divide the multiplier by 10
# when multiplier is 1 break out of loop

def string_to_integer(str)
  conversion = {"0"=> 0, "1"=> 1, "2"=> 2, "3"=> 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9}
  places = str.length
  multiplier = 10 ** (places - 1)
  int_num = 0

  str.each_char do |char|
    int_num += conversion[char] * multiplier
    multiplier /= 10
  end
  int_num
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570
puts string_to_integer("123456") == 123456

#further exploration. Convert string representing hexadecimla to integer value

# 

def hexadecimal_to_integer(str)
  conversion = {"0"=> 0, "1"=> 1, "2"=> 2, "3"=> 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, 
    "A" => 10, "B" => 11, "C" => 12, "D" => 13, "E" => 14, "F" => 15}
  places = str.length
  multiplier = 16 ** (places - 1)
  dec_number = 0

  str.each_char do |char|
    dec_number += conversion[char.upcase] * multiplier
    multiplier /= 16
  end
  dec_number
end

puts hexadecimal_to_integer('4D9f') == 19871

def fast_str_to_int(str)
  conversion = {"0"=> 0, "1"=> 1, "2"=> 2, "3"=> 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9}
  int_num = 0
  str.each_char do |char|
    int_num = 10 * int_num + conversion[char]
  end
  int_num
end

puts fast_str_to_int('4321') == 4321
puts fast_str_to_int('570') == 570
puts fast_str_to_int("123456") == 123456