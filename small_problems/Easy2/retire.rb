# retire.rb

=begin

What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!

=end

puts "What is your age?"
current_age = gets.chomp.to_i
puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

current_year = Time.now.year
working_years = retirement_age - current_age
retirement_year = current_year + working_years

puts "It's #{current_year}. You will retire in #{retirement_year}.
You have only #{working_years} years of work to go!"