# question2.rb

# What is the difference between ! and ? in Ruby? Explain what would happen in the following secnarios:
# answer: ! is the bang symbol. It is used to indicate "not" such as in != means not equal to
# additonally the bang symbol is part of the method names for some mutating methods
# the ? symbol is part of the method name for some methods that return boolean (true or false) values
# such as has_key? or start_with? or include?. It is also used in ternary expressions in a similar fashion

# 1. What is != and where should you use it?
# This is the not equal to symbol. You should use this symbol when testing 2 operands for non-equality.
# If the values are not equal the boolean true should be returned.
# for examples 3 != 5

# 2. put ! before something like !user_name
# when you put ! before a value that would be truthy such as user_name it would return false
# if user_name is falsey (false or nil) then true would be returned

# 3. put ! after something, like words.uniq!
# The bang symbol after something such as a method indicates that this is a mutating method
# words.uniq! would mutate the words object creating a new object with duplicates removed

# 4. put ? before something
# ? along with a character acts as shorthand for a single-character string literal
# ?F is the same as "F"
# 5. put ? after something
# for methods that end in ? will return boolean. After other values will return an error
# 6. put !! before something, like !!user_name
# !! before something will double negate the orinigal value
# if the oringial value was truthy then true will be returned
# if the oringial value was falsey then false will be returned
