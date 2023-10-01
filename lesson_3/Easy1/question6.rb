# question6.rb

famous_words = "seven years ago..."

famous_words.prepend("Four score and ")
p famous_words

famous_words = "seven years ago..."
p "Four score and " + famous_words

p "Four score and #{famous_words}"