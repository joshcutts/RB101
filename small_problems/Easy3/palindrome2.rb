# palindrome2.rb

=begin

Write another method that returns true if the string passed as an argument is a palindrome, 
false otherwise. This time, however, your method should be case-insensitive, 
  and it should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the palindrome? 
  method you wrote in the previous exercise.

real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false

=end

def real_palindrome?(value)
  # cleaned to remove , ' " and " " AND to downcase
  cleaned_value = value.gsub(/[,''""" "]/, "").downcase
  cleaned_value == cleaned_value.reverse
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false


a = "hello world"
a.count "lo"                   #=> 5
a.count "lo", "o"              #=> 2
a.count "hello", "^l"          #=> 4
a.count "ej-m"                 #=> 4
p a.size                       #=> 11
p a.count "aeiou"              #=> 3
p a.count "^aeiou"             #=> 3

"hello^world".count "\\^aeiou" #=> 4
"hello-world".count "a\\-eo"   #=> 4

c = "hello world\\r\\n"
c.count "\\"                   #=> 2
c.count "\\A"                  #=> 0
c.count "X-\\w"                #=> 3