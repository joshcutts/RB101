# exclusive_or.rb

=begin

The || operator returns a truthy value if either or both of its operands are truthy. 
If both operands are falsey, it returns a falsey value. The && operator returns a truthy 
value if both of its operands are truthy, and a falsey value if either operand is falsey. 
This works great until you need only one of two conditions to be truthy, the so-called exclusive or.

In this exercise, you will write a method named xor that takes two arguments, 
and returns true if exactly one of its arguments is truthy, false otherwise. 
Note that we are looking for a boolean result instead of a truthy/falsy value as returned by || and &&.

=end

=begin

xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false

=end

# def xor?(bool_one, bool_two)
#   if bool_one == true && bool_two == true
#     false
#   else
#     bool_one || bool_two
#   end
# end

# def xor?(value1, value2)
#   ((value1 && !value2) || (value2 && !value1))
# end

# def xor?(val1, val2)
#   return true if (val1 && !val2)
#   return true if (val2 && !val1) 
#   false
# end

def xor?(cal1, cal2)
  return false if (cal1 && cal2)
  !!cal1 || cal2
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false

puts "BREAK"


p xor?(false, true) == true
p xor?(42, nil) == true
p xor?(['a', 'b', 'c'], {a: 1, b: 2, c: 3}) == false
p xor?('This is truthy', (puts "This is truthy")) == true
p xor?([1, 2, 3].include?(4), 5.odd?) == true