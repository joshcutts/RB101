# alphabetical_numbers.rb

=begin

Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those 
Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, 
eighteen, nineteen

EXAMPLES

alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

=end

# create hash to convert between number and string
# use the hash to convert each number to string and put in array
# sort the array (should return alpha sorted array)
# create new array with numbers again by converting with hash
# return the sorted array

# number_array = (0..19).to_a
# string_number_array = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", 
# "eighteen", "nineteen"]
# NUM_TO_STR = number_array.zip(string_number_array).to_h
# STR_TO_NUM = string_number_array.zip(number_array).to_h

# def alphabetic_number_sort(arr)
#   sort_array = []
#   sorted_array = []

#   arr.each {|num| sort_array << NUM_TO_STR[num]}
#   sort_array.sort!

#   sort_array.each{|str_num| sorted_array << STR_TO_NUM[str_num]}
#   sorted_array
# end

# p alphabetic_number_sort((0..19).to_a) == [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]

NUM_TO_STR = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
def alphabetic_number_sort(arr)
  arr.sort_by {|number| NUM_TO_STR[number]}
end

p alphabetic_number_sort((0..19).to_a) #== [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]
