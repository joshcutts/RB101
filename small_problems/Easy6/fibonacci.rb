#fibonacci.rb

=begin

The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's enormous, especially considering that it takes 6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)


EXAMPLES

find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847

=end

# create do loop
# on each iteration calculate next fibonacci number & add one to index
# on each iteration check if the number has the number of digits you are testing for
# if so return the index, else continue

# def fibonacci(num)
#   if num < 2
#     return num
#   else
#     fibonacci(num-1) + fibonacci(num-2)
#   end
# end

# def find_fibonacci_index_by_length(num)
#   index = 1
#   fib = Hash.new {|hash, key| hash[key] = key < 2 ? key : hash[key-1] + hash[key-2] }
#   loop do
#     return index if fib[index].digits.length == num
#     index += 1
#   end
# end

def find_fibonacci_index_by_length(num)
  num1 = 1
  num2 = 1
  index = 2
  
  loop do
    index += 1
    fibonacci = num1 + num2
    return index if fibonacci.to_s.length == num

    num1 = num2
    num2 = fibonacci
  end
end

p find_fibonacci_index_by_length(2) #== 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) #== 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) #== 45
p find_fibonacci_index_by_length(100) #== 476
p find_fibonacci_index_by_length(1000) #== 4782
p find_fibonacci_index_by_length(10000) #== 47847