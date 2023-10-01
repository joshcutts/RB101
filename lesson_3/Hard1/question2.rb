# question2.rb

# what is the result of the last line in the code below

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# should be the hash... {:a=>'hi there'}
# the reason is because informal_greeting is a reference to the original
# object. The line informatl_greeintg << ' there' was using the 
# String#<< method, which modifies the object that called it.
# This means that the oringial object was changed, thereby
# impacting the value in greetings. If instead of modifying the 
# original object we wanted to modify informal_greeting
# but not greetings, there are a couple options
#
# informal_greeting = greetings[:a].clone
# informal_greeting = informal_greeting + ' there"