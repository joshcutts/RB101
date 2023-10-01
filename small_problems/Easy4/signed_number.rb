# signed_number.rb

def fast_str_to_int(str)
  conversion = {"0"=> 0, "1"=> 1, "2"=> 2, "3"=> 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9}
  int_num = 0
  str.each_char do |char|
    int_num = 10 * int_num + conversion[char]
  end
  int_num
end

def string_to_signed_integer(str)
  if str.start_with?("-")
    0 - fast_str_to_int(str.delete("-"))
  else
    fast_str_to_int(str.delete("+"))
  end
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100