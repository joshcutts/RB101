def triangle(num, quadrent=1)

  if quadrent == 1
    count = 1
    loop do
      puts ("*" * count)
      count += 1
      break if count > num
    end
  elsif quadrent == 2
    count = 1
    loop do
      puts (" " * (num-count)) + ("*" * count)
      count += 1
      break if count > num
    end
  elsif quadrent == 3
    count = num
    loop do
      puts (" " * (num -count)) + ("*" * count)
      count -= 1
      break if count == 0
    end
  elsif quadrent == 4
    count = num
    loop do
      puts ("*" * count)
      count -= 1
      break if count == 0
    end
  end

end

triangle(9,1)