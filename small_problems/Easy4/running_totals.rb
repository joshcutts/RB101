# running_totals.rb

=begin

Write a method that takes an Array of numbers, and returns an Array with the same number of elements, 
and each element has the running total from the original Array.

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

=end

# should use map since it returns a new array
# create a sum equal to zero that will hold the running total
# enumerable map for each value in the array, add the running total & return the value

# def running_total(arr)
#   sum = 0
#   arr.map {|num| sum += num}
# end

# def running_total(arr)
#   total = 0
#   arr.each_with_object([]) {|num, result| result << total += num}
# end

def running_total(arr)
  total = 0
  arr.inject([]) {|result, num| result << total += num}
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
