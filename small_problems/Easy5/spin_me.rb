# spin_me.rb

=begin

You are given a method named spin_me that takes a string as an argument and returns a string that contains the same words, 
but with each word's characters reversed. Given the method's implementation, will the returned string be the same object 
as the one passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

=end

# different objects. Using split creates an new array object

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

str = 'hello world'
puts str.object_id # 47435609148580
puts spin_me(str)#.object_id # 47435609148360

def spin_me(arr)
  arr.each do |word|
    word.reverse!
  end.join(" ")
end

arr = ['hello', 'world']
puts arr.object_id # 47264354160220
p spin_me(arr).object_id # 47264354160220