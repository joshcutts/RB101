a = "hello world"
a.count "lo"                   #=> 5
a.count "lo", "o"              #=> 2
a.count "hello", "^l"          #=> 4
a.count "ej-m"                 #=> 4
p a.size
p a.count "aeiou"
p a.count "^aeiou"              #=> 3