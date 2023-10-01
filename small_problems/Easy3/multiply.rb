# multiply.rb

=begin

Create a method that takes two arguments, multiplies them together, and returns the result.

multiply(5, 3) == 15

=end

def multiply(num1, num2)
  num1 * num2
end

# p multiply([5], 3)

def square(num, power)
  result = 1
  power.times { result = multiply(result, num)}
  result
end

puts square(2, 4)
# puts square(-8, 3)

puts 2 ** 3
puts 2 ** 4
puts 2 ** 5
puts 8 ** 3