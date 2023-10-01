# question6.rb

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

def color_valid(color)
  false unless (color == "blue" || color == "green")
end

def color_valid(color)
  color == "blue" || color == "green"
end