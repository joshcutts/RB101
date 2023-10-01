age = rand(20..200)
puts "What name do you choose?"
name = gets.chomp
name = "Teddy" if name.empty?
puts "#{name} is #{age} years old!"

=begin

Modify this program to ask for a name, 
and then print the age for that person. For an extra challenge, 
use "Teddy" as the name if no name is entered.

=end