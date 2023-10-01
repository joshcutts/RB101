#room.rb

=begin

Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).

=end

SQMETERS_TO_SQFEET = 10.7639
SQFT_TO_SQIN = 144
SQIN_TO_SQCM = 6.4516

puts "Enter the length of the room in feet"
length = gets.chomp.to_f
puts "Enter the width of the room in feet"
width = gets.chomp.to_f
area_ft = (length * width).round(2)
area_in = (area_ft * SQFT_TO_SQIN).round(2)
area_cm = (area_in * SQIN_TO_SQCM).round(2)
puts "The area of the room is:
- #{area_ft} square feet 
- #{area_in} square inches
- #{area_cm} square cm"