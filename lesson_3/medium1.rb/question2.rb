# question2.rb

#puts "the value of 40 + 2 is " + (40 + 2)

# the problem is that the integers won't be implicitly converted to strings

# solution 1 - string interpolation

puts "the value of 40 + 2 is #{40+2}" 

# solution 2 - convert the integer to a string

puts "the value of 40 + 2 is " + (40+2).to_s