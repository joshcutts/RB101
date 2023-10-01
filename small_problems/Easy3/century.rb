# century.rb

=begin

Write a method that takes a year as input and returns the century. 
The return value should be a string that begins with the century number, 
and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

=end

=begin

century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

=end


# def century(year)
#   # if the year ends with 2 00's return the 1st 2 digits and append "th" "st" or "rd" 
#   if year.to_s.end_with?("00")
#     puts year.to_s.slice(0..1)
#   # else need to return the 1st 2 digits PLUS one and append "th" "st" or "rd"
#   else
#     updated_century = (year.to_s.slice(0..1).to_i) + 1
#     puts (updated_century + 1)
#   end
# end
    
def century(year)
  if year.to_s.end_with?("00")
    century = (year/100).to_s
  else
  century = ((year / 100) + 1).to_s
  end

  if century.end_with?("11") || century.end_with?("12") || century.end_with?("13")
    "#{century}th"
  elsif
    century.end_with?("1")
    "#{century}st"
  elsif century.end_with?("2")
    "#{century}nd"
  elsif century.end_with?("3")
    "#{century}rd"
  else
    "#{century}th"
  end
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
puts century(2134)

=begin

1st
2nd
3rd
4th
5th
6th
7th
8th
9th
10th 

=end