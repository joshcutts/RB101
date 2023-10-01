# question1.rb

if false
  greeting = "hello world"
end

p greeting

# greeting is nil here and no "undefined method or local variable exception"
# is thrown. Typically when you reference an uninitialized variable Ruby
# will raise an exception stating that it's undefined. However when
# you initialize a local variable within an if clause, even if 
# that if clause doesn't get excecuted the local
# variable is initialized to nil