#searching.rb

# Write a program that solicits 6 numbers from the user, 
# then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

=begin

==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23].


==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18
The number 18 does not appear in [25, 15, 20, 17, 23].

=end


messages_arr = ["==> Enter the 1st number:", "==> Enter the 2nd number", "==> Enter the 3rd number", "==> Enter the 4th number", "==> Enter the 5th number"]
numbers = []

messages_arr.each do |message|
  puts message
  numbers << gets.chomp.to_i
end

puts "Enter the last number:"
number_six = gets.chomp.to_i

if numbers.include?(number_six)
  puts "The number #{number_six} appears in #{numbers}"
else
  puts "The number #{number_six} does not appear in #{numbers}"
end

