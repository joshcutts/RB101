def has_less_than_or_equal_to_2_decimal_points?(number)
  # Convert the number to a string
  number_str = number.to_s
  
  # Use a regular expression to check for up to 2 decimal places
  # The regular expression \.(\d{1,2})?$ matches a dot followed by 1 or 2 digits optionally at the end of the string
  if number_str =~ /^\d+(\.\d{0,2})?$/
    true
  else
    return false
  end
end

# Test the function with some examples
puts has_less_than_or_equal_to_2_decimal_points?(5.67)  # true
puts has_less_than_or_equal_to_2_decimal_points?(42.0)  # true
puts has_less_than_or_equal_to_2_decimal_points?(123)   # true
puts has_less_than_or_equal_to_2_decimal_points?(3.141592)  # false
puts has_less_than_or_equal_to_2_decimal_points?(7)     # true
puts has_less_than_or_equal_to_2_decimal_points?(7.532) #false
puts has_less_than_or_equal_to_2_decimal_points?(7.50) #false


#number_str =~ /\.(\d{1,2})?$|^(\d+)$/