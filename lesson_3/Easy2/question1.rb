# question1.rb

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if "Spot" is present

p ages.has_key?("Spot")
p ages.has_key?("Herman")
p ages.include?("Spot")
p ages.include?("Herman")
p ages.key?("Spot")
p ages.key?("Herman")
p ages.member?("Spot")
p ages.member?("Herman")
p ages.any? {|k, v| k == "Spot"}
p ages.any? {|k, v| k == "Herman"}

p ages.assoc("Herman")