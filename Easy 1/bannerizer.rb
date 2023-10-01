def print_in_box(str)
  if str.length < 80
    top = "+--+"
    side_top = "|  |"
    side_middle = "|  |"
    side_bottom = "|  |"

    str.length.times {top.insert(1, "-")}
    str.length.times {side_top.insert(1, " ")}
    side_middle.insert(2, str)
    str.length.times {side_bottom.insert(1, " ")}
    
    puts top
    puts side_top
    puts side_middle
    puts side_bottom
    puts top
  else
    top = "+--+"
    side_top = "|  |"
    side_middle = "|  |"
    side_bottom = "|  |"

    str.length.times {top.insert(1, "-")}
    str.length.times {side_top.insert(1, " ")}
    side_middle.insert(2, str)
    str.length.times {side_bottom.insert(1, " ")}
    
    puts top
    puts side_top
    puts side_middle
    puts side_bottom
    puts top
end

print_in_box("To laugh often and much; To win the respect of intelligent people and the affection of children; To earn the appreciation of honest critics and endure the betrayal of false friends; To appreciate beuty, to find the best in others; To leave the world a bit better, whether by a healthy child, a garden patch or a redeemed social condition; To know even one life has breathed easier because you have lived. This is to have succeeded")