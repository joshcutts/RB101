# question2.rb

munsters_description = "The Munsters are creepy in a good way."

# convert the string in the following ways (code will be execute on original munsters_description) above

#"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
new_munters_one = ""

munsters_description.each_char {|char| ('a'..'z').cover?(char) ? new_munters_one << char.upcase : new_munters_one << char.downcase}
p new_munters_one


#"The munsters are creepy in a good way."
new_munters_two = munsters_description.gsub("M", "m")
p new_munters_two


#"the munsters are creepy in a good way."
new_munters_three = munsters_description.downcase
p new_munters_three

#"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
new_munters_four = munsters_description.upcase
p new_munters_four

p munsters_description.swapcase
p munsters_description.capitalize
p munsters_description.downcase
p munsters_description.upcase