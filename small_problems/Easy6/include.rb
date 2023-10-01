# include.rb

=begin

Write a method named include? that takes an Array and a search value as arguments. 
This method should return true if the search value is in the array, false if it is not. 
You may not use the Array#include? method in your solution.

EXAMPLES

include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false

=end

# set condition initally to false
# step through array one value at a time checking if the set number is equal to the value
# if it is equal update condition to true
# return the condition

# def include?(arr, num)
#   val_present = false
#   val_present = true if arr.select {|element| element == num}
#   val_present
# end

# def include?(arr, num)
#   arr.select {|element| element == num} ? true : false
# end

def include?(arr, num)
  val_present = false
  index = 0
  length = arr.length
  loop do
    break if length == 0
    val_present = true if arr[index] == num
    index += 1
    break if index == length
  end
  val_present
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false