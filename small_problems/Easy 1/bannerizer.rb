def print_in_box(str)
  if str.length < 80
    top = "+--+"
    side_top = "|  |"
    side_middle = "|  |"
    side_bottom = "|  |"

    str.length.times {top.insert(1, "-")}
    str.length.times {side_top.insert(1, " ")}
    side_middle.insert(2, str)
    str.length.times {side_bottom.insert(1, " ")}
    
    puts top
    puts side_top
    puts side_middle
    puts side_bottom
    puts top
  else
    
    def string_split(str)
      words = str.split(" ")
    
      # I couldn't figure out how to test length of new string AFTER element is added
      # Was trying to determine if the length would be 80 after adding next word to the array
      # one approach is to find the longest possible word in the str then make sure that 80 - maxLength
      # is not surpassed, so if the longest word is the next word 80 won't be exceeded
      # unfortunately this is inefficient since the next word is not always the longest word, so there will be times
      # when an extra word or two could fit on the line 
      
      maxLength = 0
    
      words.each {|word| maxLength = word.length if word.length > maxLength}
    
      lines = []
      while words.length > 0
        line = []
        for i in 0..words.length-1 do 
          
          length = line.join(" ").length
          if line.join(" ").length < (80-maxLength)
            line.push(words.shift)
          end
        end
        lines.push(line)
      end
      return lines.each {|line| p line.join(" ").length  }
    end

    lines = string_split(str)
    
    top = "+" + ("-" * 82) + "+"
    side_top = "|" + (" ") * 82) + "|"
    side_middle = "|  |"
    side_bottom = "|" + ((" ") * 82) + "|"

    str.length.times {top.insert(1, "-")}
    str.length.times {side_top.insert(1, " ")}
    # for each array in the lines array
    # puts a new line with the array joined together
    side_middle.insert(2, str)
    str.length.times {side_bottom.insert(1, " ")}
    
    puts top
    puts side_top
    puts side_middle
    puts side_bottom
    puts top

end

print_in_box("To laugh often and much; To win the respect of intelligent people and the affection of children; To earn the appreciation of honest critics and endure the betrayal of false friends; To appreciate beuty, to find the best in others; To leave the world a bit better, whether by a healthy child, a garden patch or a redeemed social condition; To know even one life has breathed easier because you have lived. This is to have succeeded")

# str is longer than 80 characters long
# make an array of arrays to split the str up into 80 character sections
#    if the 80th character is in the middle of a word go back to last word
# create a new middle vertical section for each array in the array
# print each array in the middle array

def string_split(str)
  words = str.split(" ")
  #return words.inspect
  lines = []
  while words.length > 0
    line = []
    words.each_with_index do |word, idx|
      if line.join(" ").length < 80
        line.push(words.shift)
      end
    end
    lines.push(line)
  end
  return lines.inspect
end

puts string_split("To laugh often and much; To win the respect of intelligent people and the affection of children; To earn the appreciation of honest critics and endure the betrayal of false friends; To appreciate beuty, to find the best in others; To leave the world a bit better, whether by a healthy child, a garden patch or a redeemed social condition; To know even one life has breathed easier because you have lived. This is to have succeeded")