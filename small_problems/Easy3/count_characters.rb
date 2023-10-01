# count_characters.rb

=begin

Write a program that will ask a user for an input of a word or multiple words 
and give back the number of characters. Spaces should not be counted as a character.

=end

=begin
EXAMPLE 1

INPUT
Please write word or multiple words: walk

OUTPUT
There are 4 characters in "walk".

EXAMPLE 2

INPUT
Please write word or multiple words: walk, don't run

OUTPUT
There are 13 characters in "walk, don't run".

=end

# print ask for input
# get input string
# could test to make sure input is a valid string, any non-valid characters?
# create counter variable
# increment through the string one character at a time (either chars or each_char)
# use conditional to increment counter if the character is not a space
# return counter variable
# print statement that says how many characters there are are re-prints the input string

puts "Please write a word or multiple words:"
input_str = gets.chomp

chars = 0
input_str.chars.each {|char| chars += 1 if char != " " }

puts %Q(There are #{chars} characters in "#{input_str}".)

