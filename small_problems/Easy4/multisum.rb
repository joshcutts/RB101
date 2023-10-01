#multisum.rb

=begin

Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, 
and then computes the sum of those multiples. For instance, if the supplied number is 20, 
the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.

=end

=begin

multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168

=end

# create an empty array (sum this array at the end)
# do the 3 multiples first 
# create a while loop 
# while number is less than the upper num specified
# if num is divisible by 3 add to array
# next do 5 multiples 
# use another while loop 
# while iterator num is less than upper num specified
# if number is divisible by 5 && not already in the array, push to array
# return the sum of the array


def multisum(num)
  sum_array = []
  x = 1
  while x <= num
    sum_array.push(x) if x % 3 == 0
    x += 1
  end

  y = 1
  while y <= num
    if y % 5 == 0 && sum_array.include?(y) == false
      sum_array.push(y)
    end
    y += 1
  end

  sum_array.inject(:+) # alternatively sum_array.inject {|sum, number| sum + number}
end


# def multiple(num, divisor)
#   num % divisor == 0
# end

# def multisum(num)
#   sum = 0
#   1.upto(num) do |number|
#     if multiple(number, 3) || multiple(number, 5)
#       sum += number
#     end
#   end
#   sum
# end



puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168

