# clean_words.rb

=begin 

Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, 
write a method that returns that string with all of the non-alphabetic characters replaced by spaces. 
If one or more non-alphabetic characters occur in a row, you should only have one space in the result 
(the result should never have consecutive spaces).


cleanup("---what's my +*& line?") == ' what s my line '

=end

# def cleanup(string)
#   string.gsub(/[^0-9a-z]/i, ' ').split(" ").join(" ").prepend(" ") << " "
# end

# p cleanup("---what's my +*& line?") == ' what s my line '

# def cleanup(str)
#   str.gsub(/[^a-z]/, " ").squeeze(" ")
# end

# p cleanup("---what's my +*& line?") #== ' what s my line '

ALPHABET = ("a".."z").to_a

def cleanup_sol(text)
  clean_chars = []
  
  text.chars.each do |char|
    if ALPHABET.include>(char)
      clean_chars << char
    else
      clean_chars << " " unless clean_chars.last == " "
    end
  end
  clean_chars.join
end