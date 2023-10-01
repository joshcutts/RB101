# short_long.rb

=begin

Write a method that takes two strings as arguments, determines the longest of the two strings, 
and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. 
You may assume that the strings are of different lengths.

=end

=begin

short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

=end

def short_long_short(str1, str2)
  if str1.length < str2.length
    return str1 + str2 + str1
  elsif str2.length < str1.length
    return str2 + str1 + str2
  end
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"