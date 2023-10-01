
# def center_of(str)
#   if str.length.odd?
#     num = (str.length/2) + 1
#     return str.split("")[num-1]
#   else
#     num = str.length/2 - 1
#     return str.split("")[num..num+1].join("")
#   end

  
# end



# puts center_of('I love ruby') == "e"
# puts center_of('Launch School') == ' '
# puts center_of('Launch') == 'un'
# puts center_of('Launchschool') == 'hs'
# puts center_of('x') == 'x'

# # "Launchschool".each_char.with_index {|char, index| puts "#{index+1}: #{char}"}

# # test = "I love ruby"
# # puts test[6]

def center_of(string)
  center_index = string.size / 2
  if string.size.odd?
    string[center_index]
  else
    string[center_index - 1, 2]
  end
end

puts center_of('I love ruby') == "e"
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'