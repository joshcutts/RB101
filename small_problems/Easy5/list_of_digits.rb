# list_of_digits.rb

=begin

Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

EXAMPLES

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

=end

# convert the number to a string and split into an array
# convert the array values to numbers

def digit_list(num)
  num.to_s.split("").map {|digit| digit.to_i}
end

p digit_list(12345) == [1, 2, 3, 4, 5]     # => true
p digit_list(7) == [7]                     # => true
p digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
p digit_list(444) == [4, 4, 4]             # => true