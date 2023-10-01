# merge.rb

=begin

Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. 
There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.


EXAMPLES

merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

=end

# def merge(arr1, arr2)
#   arr2.each {|elem| arr1 << elem}
#   arr1.uniq
# end

# def merge(arr1, arr2)
#   arr1 << arr2
#   arr1.flatten.uniq
# end

# def merge(arr1, arr2)
#   arr1.union(arr2)
# end

def merge(arr1, arr2)
  arr1 | arr2
end

p merge([1, 3, 5], [3, 6, 9]) #== [1, 3, 5, 6, 9]

