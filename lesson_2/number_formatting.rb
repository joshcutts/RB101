# number = 2499738630
def format_number(number)
  num_groups = number.chars.to_a.reverse.each_slice(3)
  num_groups.map(&:join).join(',').reverse
end

p format_number("1")
p format_number("1000")
p format_number("500000")
p format_number("1234567891")
p format_number("234000")
p format_number("10")

p "500,000,000".delete(",")