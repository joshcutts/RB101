# integer_validation.rb

def valid_integer?(str_num)
  str_num.to_i.to_s == str_num
end



# p valid_integer?("5")
# p valid_integer?("0")
# p valid_integer?("test")
# p valid_integer?("-5")
# p valid_integer?("00")

def valid_float?(str_float)
  str_float.to_f.to_s == str_float
end

# p valid_float?("1.1")
# p valid_float?("1.0")
# p valid_float?("0.0")
# p valid_float?("10.43")
# p valid_float?("test")
# p valid_float?("5")

def valid_number?(num)
  valid_integer?(num) || valid_float?(num)
end

p valid_number?("5") == true
p valid_number?("5.5") == true
p valid_number?("test") == false