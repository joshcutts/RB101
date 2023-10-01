# reversed_arrays.rb

=begin

Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.

EXAMPLES

list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true

=end


def reversed(arr)
  flip_length = (arr.length/2).floor
  index1 = 0
  index2 = 1
  if arr.length > 0
    loop do
      arr[index1], arr[-index2] = arr[-index2], arr[index1]
      index1 += 1
      index2 += 1
      break if index2 > flip_length
    end
  else
    arr
  end
  arr
end

# list = [1,2,3,4]
# list[0], list[-1] = list[-1], list[0]
# list[1], list[-2] = list[-2], list[1]
# p list

# p list = [1,2,3,4]
# p result = reversed(list)
# p result == [4, 3, 2, 1] # true
# p list == [4, 3, 2, 1] # true
# p list.object_id == result.object_id # true

# p list = %w(a b e d c)
# p reversed(list) == ["c", "d", "e", "b", "a"] # true
# p list == ["c", "d", "e", "b", "a"] # true

# p list = ['abc']
# p reversed(list) == ["abc"] # true
# p list == ["abc"] # true

p list = []
p reversed(list) #== [] # true
p list == [] # true