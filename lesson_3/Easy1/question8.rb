# question8.rb

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# create an array containing only two elements, Barney's name and Barney's number

new_array = flintstones.select {|k,v| k == "Barney"}.to_a[0]
p new_array

second_array = [flintstones.key(2), flintstones.fetch("Barney")]
p second_array

p flintstones.assoc("Barney")

p flintstones.keys[2]