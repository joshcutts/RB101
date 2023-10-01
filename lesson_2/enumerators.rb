# enumerators.rb

# playing with enumerators

# fighter = 'Jackie'
# fighters_list = ['Bruce', 'Rocky', 'Rambo']

# for fight in fighters_list
#   puts fight
# end

# puts "Your fighter is #{fighter}"

array = [1,2,3]

mapped_array = array.map {|num| num + 1 }

mapped_array.tap {|value| p value}

mapped_and_tapped = mapped_array.tap {|value| p 'hello' }
p mapped_and_tapped