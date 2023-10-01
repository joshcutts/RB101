# in_to_string.rb

=begin 

integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'

=end

# def integer_to_string(num)
#   if num == 0
#     "0"
#   else
#     str_num = []
#     length = Math.log10(num).round(0)
#     str_num << num / 10 ** length
#     length -= 1
#     loop do
#       str_num << num / (10 ** length) % (num / 10 ** length).floor(-1)
#       length -= 1
#       break if length < 0
#     end
#     str_num.join()
#   end
# end

# integer_to_string(4321) == '4321'
# integer_to_string(0) == '0'
# integer_to_string(5000) == '5000'

# p 4321 / 1000
# p (4321 / 100) % 10
# p (4321 / 10 ) % 10
# p (4321 / 1) % 100 % 10
# p "SPACE"
# p 10123 / 10000 # 10 ** 4
# p 17123 / (10000/10) % 10 
# p 17123 / (10000/10/10) % 100 % 10
# p 17123 / (10000/10/10/10) % 100 % 10
# p 17123 / (10000/10/10/10/10) % 100 % 10
# p "SPACE"
# p 17234 / 10000
# p 17234 / 1000 % 10
# p 17234 / 100 % 10
# p 17234 / 10 % 10
# p "SPACE"
# p 172345 / 100000 # 10 ** 5
# p 172345 / 10000 % 10
# p 172345 / 1000 % 170
# p 172345 / 100 % 1720
# p 127345 / 10 % 12730
# p 127345 % 127340
# p "SPACE"
# p 172345 / 100000
# p 172345 / 10000 % (172345 / 10000).floor(-1)
# p 172345 / 1000 % (172345 / 1000).floor(-1)
# p 172345 / 100 % (172345 / 100).floor(-1)
# p 172345 / 10 % (172345 / 10).floor(-1)
# p 172345 / 1 % (172345 / 1).floor(-1)

# def digits(num)
#   str_num = []
#   length = Math.log10(num).round(0)
#   if num == 0
#     "0"
#   elsif length < 1 
#     str_num << num
#   else
#     str_num << num / (10 ** length)
#     length -= 1
#     loop do
#       str_num << num / (10 ** length) % (num / 10 ** length).floor(-1)
#       length -= 1
#       break if length < 0
#     end
#   end
#   str_num.join()
# end

# p digits(5000)

# p Math.log10(6).round(0)
# p 6 / (10 ** 1)

DIGITS = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

def integer_to_string(number)
  result = ""
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

p integer_to_string(5000)