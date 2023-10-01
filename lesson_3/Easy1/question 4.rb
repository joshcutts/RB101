# question4.rb

numbers = [1, 2, 3, 4, 5]

p numbers.delete_at(1)
p numbers
numbers = [1, 2, 3, 4, 5]
#numbers.delete_at(1) will return the value at index 1 (2) and remove it from the numbers array
p numbers.delete(1)
# numbers.delete(1) will return the value 1 which is at index 0 and remove it from the numbers array
p numbers
