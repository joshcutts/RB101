# letter_counter.rb

=begin 

Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

EXAMPLES

word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

=end

# split the string into an array
# iterate through each string in the array and count the letters in the string
# create an empty hash that will hold the final result
# if the length of the string is already in the hash add one to the count
# otherwise add the new string length to the hash and set the count to one
# return the hash

# def word_sizes(str)
#   words_array = str.split(" ")
#   sizes_hash = {}

#   words_array.each do |word|
#     word_length = word.length
#     if sizes_hash.has_key?(word_length)
#       sizes_hash[word_length] += 1
#     else
#       sizes_hash[word_length] = 1
#     end
#   end
#   sizes_hash
# end

# def word_sizes(str)
#   str.split.map {|word| word.length}.tally
# end

def word_sizes(str)
  lengths = str.split.map {|word| word.length}
  lengths.count
end

p word_sizes('Four score and seven.') #== { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') #== { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") #== { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') #== {}

# p Hash.new(0)