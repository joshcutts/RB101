# negative_number.rb

# option 1 take absolute value of number and subtract 2x the number to get negative. if 0 shouldn't matter

# option 2 if number > 0 subtract 2x the number to get negative

=begin 

Write a method that takes a number as an argument. 
If the argument is a positive number, return the negative of that number. 
If the number is 0 or negative, return the original number.

=end

# def negative(num)
#   if num > 0
#     0 - num
#   else
#     num
#   end
# end

def negative(num)
  num > 0 ? 0 - num : num
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0      # There's no such thing as -0 in ruby