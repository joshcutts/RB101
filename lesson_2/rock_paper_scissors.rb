# rock_paper_scissors.rb

VALID_CHOICES = %w[rock paper scissors lizard spock]
VALID_CHOICES_ABREV  = %w[r p sc l sp]

# create one array with all valid choices & their abbreviations, 2 step process
# first create an array combining the full names of the choices with array of abbreviations

all_choices = []

i = 0
loop do
  all_choices << VALID_CHOICES[i]
  all_choices << VALID_CHOICES_ABREV[i]
  i += 1
  break if i == VALID_CHOICES.length
end

# second creating a string to present as options for the user with formatting so abbreviations
# are within () immediately following the respective choice
choices_plus_abrev_str = ""
x = 0
loop do
  if x.odd?
    choices_plus_abrev_str << "(#{all_choices[x]}), " unless x == all_choices.length - 1
    if x == all_choices.length - 1
      choices_plus_abrev_str << "(#{all_choices[x]})"
    end
  else
    choices_plus_abrev_str << "#{all_choices[x]} "
  end
  x += 1
  break if x > all_choices.length
end

# listing the verbs for combinations of choices in hash so outcome can be described at conclusion of game
VERBS = {
  'scissors_paper' => 'cuts',
  'paper_rock' => 'covers',
  'rock_lizard' => 'crushes',
  'lizard_spock' => 'poisons',
  'spock_scissors' => 'smashes',
  'scissors_lizard' => 'decapitates',
  'lizard_paper' => 'eats',
  'paper_spock' => 'disproves',
  'spock_rock' => 'vaporizes',
  'rock_scissors' => 'crushes'
}

# hash of what each choice will win against for quick & less complex lookup
WINNING_COMBOS = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'spock' => ['scissors', 'rock'],
  'lizard' => ['spock', 'paper']
}

# convert abbreviations back to full choice text if abbreviations are input from user
def convert_raw_choice(input)
  if input.length > 2
    converted_choice = input
  else
    choices_conversion_hash = VALID_CHOICES_ABREV.zip(VALID_CHOICES).to_h
    converted_choice = choices_conversion_hash[input]
  end
  converted_choice
end


# formatting messages
def prompt(message)
  Kernel.puts("=> #{message}")
end

# testing for a win, returns true if the win is found in the hash
def win?(first, second)
  WINNING_COMBOS[first].include?(second)
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("You lose!")
  else
    prompt("Tie Game!")
  end
end

# based on whether the player or the computer wins present the correct verb and order
# of choices so we know what choice beat what choice based on the rules
# for example - rock crushes scissors
def describe_outcome(first, second)
  key = "#{first}_#{second}"
  if win?(first, second)
    prompt("#{first.capitalize()} #{VERBS[key]} #{second.capitalize()}")
  elsif win?(second, first)
    reverse_key = "#{second}_#{first}"
    prompt("#{second.capitalize()} #{VERBS[reverse_key]} #{first.capitalize()}")
  end
end

# rock, paper scissors art from https://gist.github.com/wynand1004/b5c521ea8392e9c6bfe101b025c39abe
# spock adopted from https://www.deviantart.com/astrotorical/art/Spock-425909744
# lizard adopted from https://www.asciiart.eu/animals/reptiles/lizards - jro
def rock_paper_scissors_art()
  puts ""
  puts ""
  puts ""
  puts "     ROCK               PAPER                 SCISSORS              LIZARD                     SPOCK"
  puts "     _______           _______                _______               _.--._       /|           .     .    "
  puts "---'   ____)      ---'    ____)__         ---'   ____)____        .'()..()`.    / /         .\\ \\   | |.  "
  puts "      (_____)                ______)                ______)      (_`-.__.-'_)  ( (          \\ \\ \\  | | | "
  puts "      (_____)               _______)             __________)     _. -.__.- ._-.-'_.       _  \\ \\ \\ |   | "
  puts "      (____)               _______)            (____)           _. /-____-\ ._ -'         ' '_|         | "
  puts "---.__(___)       ---.__________)        ---.__(___)             \\\\`-.__.-'//             `-_         .`  "
  puts "                                                                   |/\\||/\\|                  `-_____-`   "
  puts ""
  puts ""
end

# formatting to make keeping track of separate games easier
def game_counter_display(count)
  puts ""
  puts ""
  puts ""
  prompt("Starting game #{count}")
  puts ""
  puts ""
  puts ""
end

# display the rules of the game if the user wants
def display_rules
  loop do
    prompt("Do you want to see the rules of the game?(Y/N)")
    response = gets.chomp.downcase
    if response == "y"
      prompt("Rules of the game are as follows:")
      prompt("Scissors cuts Paper")
      prompt("Paper covers Rock")
      prompt("Rock crushes Lizard")
      prompt("Lizard poisons Spock")
      prompt("Spock smashes Scissors")
      prompt("Scissors decapitates Lizard")
      prompt("Lizard eats Paper")
      prompt("Paper disproves Spock")
      prompt("Spock vaprozes Rock, and as it always has")
      prompt("Rock crushes Scissors")
      break
    elsif response == "n"
      break
    end
    prompt("Invalid response") unless response == "n"
  end
end

def count_wins(player, computer, player_score, computer_score)
  if win?(player, computer)
    player_score += 1
  elsif win?(computer, player)
    computer_score += 1
  end
  return player_score, computer_score
end

# Welcome!
prompt("Welcome to rock, paper, scissors, lizard, spock!")
prompt("The first player to 3 wins will be crowned the GRAND WINNER!")
rock_paper_scissors_art()

display_rules()

loop do
  game_counter = 1
  player_wins = 0
  computer_wins = 0
  while player_wins < 3 && computer_wins < 3
    game_counter_display(game_counter)
    raw_choice = ''
    loop do
      prompt("Please choose one: #{choices_plus_abrev_str}")
      raw_choice = Kernel.gets().chomp().downcase()
      if all_choices.include?(raw_choice)
        break
      else
        prompt("That's not a valid choice. Please try again.")
      end
    end

    choice = convert_raw_choice(raw_choice)

    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{choice.capitalize()}; Computer chose: #{computer_choice.capitalize()}")
    describe_outcome(choice, computer_choice)
    display_result(choice, computer_choice)
    
    game_counter += 1
    

    player_wins, computer_wins = count_wins(choice, computer_choice, player_wins, computer_wins)

    # adding logic within while loop to have the Grand Winner declared after 3 wins
    if player_wins < 3 && computer_wins < 3
    prompt("The GRAND WINNER is crowned with 3 wins.")
    prompt("Currently you have #{player_wins} wins and the computer has #{computer_wins} wins")
    else 
      if player_wins == 3
        prompt("You are the GRAND WINNER! Congratulations!")
      else
        prompt("The computer is the GRAND WINNER!")
      end
    end
  end

  prompt("Do you want to play again? (Y/N)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
rock_paper_scissors_art()
prompt("Thanks for playing #{VALID_CHOICES.join(', ')}!")
