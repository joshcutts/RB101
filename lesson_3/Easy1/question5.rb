# question5.rb

# Programatically determine if 42 lies between 10 and 100

p 42.between?(10, 100)

if 10 in (10..100)
  p true
else
  p false
end

p (10..100).include?(42)
p (10..100).to_a
p (10..100).cover?(42)

# ('aaaaaa'..'zzzzzz').include?('yellow')
('aaaaaa'..'zzzzzz').cover?('yellow')
p ('a'..'z').cover?('yellow')