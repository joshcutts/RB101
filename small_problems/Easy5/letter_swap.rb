# letter_swap.rb

=begin

Given a string of words separated by spaces, write a method that takes this string of words 
and returns a string in which the first and last letters of every word are swapped.

You may assume that every word contains at least one letter, and that the string will always contain at least one word. 
You may also assume that each string contains nothing but words and spaces.

swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

=end

# def swap(string)
#   final_arr = []
#   string.split(" ").each do |str| 
#     if str.length == 1
#       final_arr << str
#     else
#       final_arr << (str[-1] + str[1..-2] + str[0])
#     end
#   end
#   final_arr.join(' ')
# end

# p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') == 'ebcdA'
# p swap('a') == 'a'

# def swap_first_last_characters(a, b)
#   a, b = b, a
# end

# word = "testing"
# p swap_first_last_characters(word[0], word[-1])

def word_swap(stri)
  stri[0], stri[-1] = stri[-1], stri[0]
  stri
end

p word_swap("testing")