# daily_double.rb

=begin

Write a method that takes a string argument and returns a new string that contains the value of the original string with 
all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

EXAMPLES

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

=end

# create new empty string to append to - this will be the corrected new string
# iteratre through the given string one character at a time
# if the current character is not equal to the previous character add it to the empty string - check the last char of the reduced string array
# return the correctednew string

def crunch(str)
  reduced_string = []
  str.each_char {|char| reduced_string << char if char != reduced_string.last}
  reduced_string.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

def crunch_regex(str)
  str.gsub(/(\w)\1*/, '\1')
end

p crunch_regex('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch_regex('4444abcabccba') == '4abcabcba'
p crunch_regex('ggggggggggggggg') == 'g'
p crunch_regex('a') == 'a'
p crunch_regex('') == ''