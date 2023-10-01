# question7.rb

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# ["Fred", "Wilma", ["Barney", "Betty"], ["Barney", "Betty"]]

p flintstones
p flintstones.flatten

brain_teaser = []

# loop through the array
# if the current index of the array is an array, loop through that array one value at a time

i = 0
loop do
  if flintstones[i].kind_of?(Array)
    j = 0
    loop do
      length = flintstones[i].length
      brain_teaser << flintstones[i][j]
      j += 1
      break if j == length 
    end
  else
    brain_teaser << flintstones[i]
  end
  i += 1
  break if i == flintstones.length
end

p brain_teaser
