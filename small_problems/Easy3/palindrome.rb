#palindrome.rb

=begin

Write a method that returns true if the string passed as an argument is a palindrome, false otherwise. 
A palindrome reads the same forward and backward. For this exercise, case matters as does punctuation and spaces.

=end

=begin

palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true

=end

def palindrome?(str)
  str == str.reverse
end


p palindrome?('madam') == true
p palindrome?('Madam') == false     # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
p palindrome?([1,2,3,2,1]) == true
p palindrome?(%q(m a d a m))