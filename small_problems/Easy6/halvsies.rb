# halvsies.rb

=begin

Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the 
first half and second half of the original Array, respectively. If the original array contains an odd number of elements, 
the middle element should be placed in the first half Array.

EXAMPLES

halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]

=end

# find length and divide by two, round up (half)
# create empty array for final result
# push index from 0 to half to final result array
# push half to -1 of index to the final array

def halvsies(arr)
  half = (arr.length / 2.0).ceil
  nested_arr = []
  nested_arr << arr[0..half-1]
  nested_arr << arr[half..-1]
  nested_arr
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]