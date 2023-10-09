# rock_paper_scissors.rb

# needed to change directory on my system to access yaml
# adjust as necessary
Dir.chdir("./lesson_2/rpsls")
require "yaml"
MESSAGES = YAML.safe_load(File.read("messages_yaml.yml"))
VALID_CHOICES = %w[rock paper scissors lizard spock]
VALID_CHOICES_ABREV = %w[r p sc l sp]

def get_choice(messages)
  all_choices = VALID_CHOICES + VALID_CHOICES_ABREV
  raw_choice = ''
  loop do
    prompt(messages["prompt_choice"])
    raw_choice = gets.chomp.downcase
    if all_choices.include?(raw_choice)
      break
    else
      prompt(messages["invalid_choice"])
    end
  end
  convert_raw_choice(raw_choice)
end

def convert_raw_choice(input)
  if input.length > 2
    converted_choice = input
  else
    choices_conversion_hash = VALID_CHOICES_ABREV.zip(VALID_CHOICES).to_h
    converted_choice = choices_conversion_hash[input]
  end
  converted_choice
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  winning_combos = {
    'rock' => ['scissors', 'lizard'],
    'paper' => ['rock', 'spock'],
    'scissors' => ['paper', 'lizard'],
    'spock' => ['scissors', 'rock'],
    'lizard' => ['spock', 'paper']
  }

  winning_combos[first].include?(second)
end

def display_result(player, computer, messages)
  if win?(player, computer)
    prompt(messages["win"])
  elsif win?(computer, player)
    prompt(messages["lose"])
  else
    prompt(messages["tie"])
  end
  sleep(3)
end

verbs = {
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

def describe_outcome(first, second, verbs)
  key = "#{first}_#{second}"
  if win?(first, second)
    prompt("#{first.capitalize()} #{verbs[key]} #{second.capitalize()}")
    sleep(2)
  elsif win?(second, first)
    reverse_key = "#{second}_#{first}"
    prompt("#{second.capitalize()} #{verbs[reverse_key]} #{first.capitalize()}")
    sleep(2)
  end
end

# rock, paper scissors art from https://gist.github.com/wynand1004/b5c521ea8392e9c6bfe101b025c39abe
# spock adapted from https://www.deviantart.com/astrotorical/art/Spock-425909744
# lizard adapted from https://www.asciiart.eu/animals/reptiles/lizards - jro
def rock_paper_scissors_art(messages)
  puts ""
  puts ""
  puts messages["art"]
  puts ""
  puts ""
end

def display_intro(messages)
  puts "+ #{'-' * 62} +"
  puts "| #{messages['grand_winner_intro']} |"
  puts "+ #{'-' * 62} +"
  sleep(0.5)
  puts "."
  sleep(0.5)
  puts ".."
  sleep(0.5)
  puts "..."
  sleep(0.5)
end

def display_scoreboard(count, player_wins, computer_wins)
  puts "+#{'-' * 51}+"
  puts "|" + "Starting game #{count}".center(51) + '|'
  puts "|#{'-' * 51}|"
  puts "|" + "You".center(25) + "|" + 'Computer'.center(25) + '|'
  puts "|#{'-' * 51}|"
  puts '|' + player_wins.to_s.center(25) + '|' + computer_wins.to_s.center(25) + '|'
  puts "|#{' ' * 25}|#{' ' * 25}|"
  puts "+#{'-' * 51}+"
end

def display_rules(messages)
  loop do
    prompt(messages["rules_prompt"])
    response = gets.chomp.downcase
    if response == "y"
      puts(messages["rules"])
      sleep(4)
      break
    elsif response == "n"
      sleep(1)
      break
    end
    prompt(message["invalid_input"]) unless response == "n"
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

def display_grandwinner(player_score, messages)
  if player_score == 3
    prompt(messages["player_grand_winner"])
  else
    prompt(messages["computer_grand_winner"])
  end
end

def get_yes_no_input(messages)
  continue = ''
  loop do
    continue = gets.chomp.downcase
    break if continue.start_with?("y") || continue.start_with?("n")
    prompt(messages["invalid_input"])
  end
  continue
end

system("clear")
prompt(MESSAGES["welcome"])
rock_paper_scissors_art(MESSAGES)
display_rules(MESSAGES)

loop do
  display_intro(MESSAGES)
  game_counter = 1
  player_wins = 0
  computer_wins = 0

  while player_wins < 3 && computer_wins < 3
    display_scoreboard(game_counter, player_wins, computer_wins)

    choice = get_choice(MESSAGES)
    computer_choice = VALID_CHOICES.sample

    prompt(format(MESSAGES["summarize_choices"],
                  choice: choice.capitalize,
                  computer_choice: computer_choice.capitalize))
    describe_outcome(choice, computer_choice, verbs)
    display_result(choice, computer_choice, MESSAGES)

    game_counter += 1
    player_wins, computer_wins = count_wins(choice,
                                            computer_choice,
                                            player_wins,
                                            computer_wins)

    if player_wins == 3 || computer_wins == 3
      display_grandwinner(player_wins, MESSAGES)
    end
    system("clear")
  end

  prompt(MESSAGES["play_again"])
  answer = get_yes_no_input(MESSAGES)
  break unless answer.downcase().start_with?('y')
end
system("clear")
rock_paper_scissors_art()
prompt(MESSAGES["goodbye"])
