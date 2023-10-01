name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# the bang suffix is a mutating method. name first points to a location in memory and stores the string value Bob
# then save name on line 2 points to the name variable
# when on line 3 we mutate the caller we change both name and save_name since they both point to the same object in memory
# 