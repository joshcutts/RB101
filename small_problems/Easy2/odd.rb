# odd.rb
# count = 1
# loop do
#   puts count if count.odd?
#   count += 1
#   break if count == 100
# end

# (1..100).to_a.each {|num| puts num if num.to_i.odd?}

for i in 1..100
  puts i if i % 2 == 1
end
