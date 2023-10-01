# pseudocode_practice.rb

# 1. a method that returns the sum of two integers

=begin

# english pseudocode
define a method that takes two integers as arguments
add number2 to number 1, no explicit return is needed
end the method

=end
puts "ADDITION TESTS"

def addition(num1, num2)
  num1 + num2
end

p addition(1, 1) == 2 #true
p addition(5, 5) == 10 #true
p addition(-1, -2) == -3 #true

# 2. a method that takes an array of strings and returns a string that is all those strings concatenated togeter

=begin

this could be solved quickly with join
alternatively could solve using looping

create an empty string that will hold the final result
loop through the array of strings one string at a time
on each iteration add the string to the emtpy string created
return the string holder which is the final result

=end
puts "JOIN STRINGS TESTS"
def join_strings(str_arr)
  result = ""
  str_arr.each {|str| result << str}
  result 
end

p join_strings(["I", "love", "spam", "and", "eggs"]) == "Ilovespamandeggs"
p join_strings([]) == ""

# create a method that takes an array of integers and 
# returns a new array with every other element from 
# the original array, starting with the first element.

# PSEUDOCODE
=begin

create a new result array to hold the odd index integers
iteratre through each integer in the integer array
if the index of the array is odd push to a new result array
else move to the next element in the array

=end

puts "EVERY OTHER TESTS"
# def every_other(int_array)
#   result_arr = []
#   int_array.each_with_index {|number, index| result_arr << number if (index+1).odd?}
#   result_arr
# end

def every_other(int_array)
  int_array.select.with_index {|number, index| number if (index+1).odd?}
end

p every_other([1,4,7,2,5])

# a method that determines the index of the 3rd occurrence of a given character in a string. 
# For instance, if the given character is 'x' and the string is 'axbxcdxex', the method should 
# return 6 (the index of the 3rd 'x'). If the given character does not occur at least 3 times, return nil.

puts "THREE OCCURENCE TESTS"

=begin

PSEUDOCODE
create a counter variable that will keep track of how many times the given character occurs
iterate through each character in the string one at a time
if the character in question occurs add one to the counter
when the counter equals 3 return the index
if the counter doesn't reach 3 return nil

EXAMPLE

third_occurence('axbxcdxex', "x") == 6

=end

def third_occurence(str_array, given_char)
  counter = 0
  index = 0
  length = str_array.length
  loop do
    counter += 1 if str_array[index] == given_char
    return index if counter == 3
    index += 1
    return nil if index == length
  end

end

p third_occurence('axbxcdxex', "x") #== 6
p third_occurence("aa", "a") == nil

puts "MERGE TESTS"

# create a method that takes two arrays of numbers and returns the result of merging the arrays. 
# The elements of the first array should become the elements at the even indexes of the returned array, 
# while the elements of the second array should become the elements at the odd indexes. For instance:

# EXAMPLES
# merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]

# create an empty array that will hold the final result
# find the length of the total ending array by adding the length of the 2 array
# use a do loop to iterate over the 1st and 2nd arrays (will reference both in the loop)
# if the final_array_index is even add the number from the 1st array to the final array
# if the final_array_index is odd add the number from the 2nd array to the final array
# return the final array

def merge(arr1, arr2)
  final_arr = []
  even_index = 0
  odd_index = 0
  final_arr_index = 0
  loop do
    if final_arr_index.even?
      final_arr << arr1[even_index]
      even_index += 1
      final_arr_index += 1
    else
      final_arr << arr2[odd_index]
      odd_index +=1
      final_arr_index += 1
    end
    break if final_arr_index == arr1.length + arr2.length
  end
  final_arr
end

p merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]

