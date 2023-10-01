# consecutive_integers.rb

=begin

Write a program that asks the user to enter an integer greater than 0, 
then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

EXAMPLE

>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.


>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.

=end

# print statements
# one to ask for an integer greater than 0
# get input (gets.chomp)
# make sure its a number and its greater than 0
# second one to ask for s to compute sum  p for product
# if statement
# if s -> sum; if p -> product
# print statement summary & answer

input_int = nil
puts "Please enter an integer greater than 0:"
loop do
  input_int = gets.chomp
  break if input_int.to_i != 0 && input_int.to_i > 0
  puts "Input was not a valid integer. Please enter an integer greater than 0"
end

input_int = input_int.to_i

product_or_sum = ""
loop do
  puts "Enter 's' to compute the sum, 'p' to compute the product."
  product_or_sum = gets.chomp
  break if product_or_sum == "s" || product_or_sum == "p"
end

def calculate_product(num)
  (1..num).to_a.inject {|product, element| product * element }
end

def calculate_sum(num)
  (1..num).to_a.inject {|sum, element| sum + element }
end

if product_or_sum == 'p'
  product = calculate_product(input_int)
  puts "The product of integers between 1 and #{input_int} is #{product}"
elsif product_or_sum == 's'
  sum = calculate_sum(input_int)
  puts "The sum of integers between 1 and #{input_int} is #{sum}"
end

# sum = 0
# (1..5).to_a.each {|element| sum += element}
# puts sum

# product = 1
# (1..5).to_a.each {|element| product *= element}
# puts product

# prod = 1
# count = 1
# loop do
#   break if count > 5
#   prod *= count
#   count +=1
# end

# puts prod

# puts [1, 2, 3, 4, 5].inject {|sum, element| sum * element }