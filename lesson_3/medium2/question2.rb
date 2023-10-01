# question2.rb

a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# integers are immutable so they all have the same object id
# true, false and nil are also handled specially
# every instance of true will all have the same object id
# This also has to do with the immutability of true, false and nil

