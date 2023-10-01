#arithmetic.rb


=begin

Write a program that prompts the user for two positive integers, 
and then prints the results of the following operations on those two numbers: 
addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

=end

=begin
EXAMPLE
==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103
=end

puts "==> Enter the first number:"
int_one = gets.chomp.to_f

int_two = nil
loop do
  puts "==> Enter the second number:"
  int_two = gets.chomp.to_f
  break if int_two != 0
  puts "Invalid integer. Please choose a non-zero integer."
end

answers = [int_one+int_two, int_one-int_two, int_one*int_two, int_one/int_two, int_one%int_two, int_one**int_two]
answers_formatted = answers.map {|answer| format("%.2f", answer) } 
puts answers.inspect
operations = %w[+ - * / % **]

test = operations.zip(answers_formatted).to_h
test.each {|operation, answer| puts "#{int_one} #{operation} #{int_two} = #{answer}" }

