# question3.rb

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

# ages[additional_ages.key(22)] = 22
# ages[additional_ages.key(237)] = 237

p ages

# marilyn = additional_ages.assoc("Marilyn")
# spot = additional_ages.assoc("Spot")

# ages[marilyn[0]] = marilyn[1]
# ages[spot[0]] = spot[1]


ages.merge!(additional_ages)
p ages