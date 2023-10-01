# calculator.rb
# needed to change directory on my system to access yaml
# adjust as necessary
Dir.chdir("./lesson_2/calculator")
require "yaml"
MESSAGES = YAML.safe_load(File.read("messages_yaml.yml"))

def prompt(message)
  puts "=> #{message}"
end

# method to determine if a number from gets (string) is a valid integer
def valid_int?(num)
  num.to_i.to_s == num
end

# method to determine if a number from gets (string) is a valid float
def valid_float?(str_float)
  str_float.to_f.to_s == str_float
end

# combining the valid_integer? and valid_float methods to test for valid num
def valid_number?(num)
  valid_int?(num) || valid_float?(num)
end

def get_language(messages)
  language = ""
  loop do
    language = gets.chomp.downcase
    break if %w(1 english en
                2 spanish español es
                3 german deutsch de).include?(language)
    prompt(messages["invalid_language"])
    prompt(messages["languages"])
  end
  language
end

LANGUAGE_CONVERSION_HASH = {
  "1" => "en",
  "english" => "en",
  "en" => "en",
  "2" => "es",
  "spanish" => "es",
  "español" => "es",
  "es" => "es",
  "3" => "de",
  "German" => "de",
  "deutsch" => "de",
  "de" => "de"
}

def convert_raw_lang_input(input)
  LANGUAGE_CONVERSION_HASH[input]
end

def get_name(messages, lang)
  name = gets.chomp
  loop do
    if name.strip.empty?
      prompt(messages[lang]["valid_name"])
    else
      break
    end
  end
  name
end

def get_input_num(messages, lang)
  num = ""
  loop do
    num = gets.chomp
    break if valid_number?(num)
    prompt(messages[lang]["valid_num"])
  end
  num
end

def get_operator_input(messages, lang)
  operator = ''
  loop do
    operator = gets.chomp.downcase
    break if %w(1 add addition agregar hinzufügen +
                2 subtract subtraction restar subtrahieren -
                3 multiply multiplication multiplicar multiplizieren *
                4 divide division dividir teilen /).include?(operator)
    prompt(messages[lang]["valid_operator"])
  end
  operator
end

OPERATOR_INPUT_TO_NUM = {
  "1" => ["1", "add", "addition", "+", "agregar", "hinzufügen"],
  "2" => ["2", "subtract", "subtraction", "-", "restar", "subtrahieren"],
  "3" => ["3", "multiply", "multiplication",
          "*", "multiplicar", "multiplizieren"],
  "4" => ["4", "divide", "division", "/", "dividir", "teilen"]
}

def convert_raw_operator_input(input)
  operator_hash = OPERATOR_INPUT_TO_NUM.select do |_key, value|
    value.include?(input)
  end
  operator_hash.keys[0]
end

def convert_operator_to_verb(operator, messages, language)
  operator_to_verb = {
    "1" => messages[language]["Adding"],
    "2" => messages[language]["Subtracting"],
    "3" => messages[language]["Multiplying"],
    "4" => messages[language]["Dividing"]
  }
  operator_to_verb[operator]
end

def division(operand1, operand2, messages, lang, name)
  if operand2.to_i == 0
    prompt(format(messages[lang]["zero_division"], name: name))
  else
    operand1.to_f / operand2.to_f
  end
end

def calculate_result(operator, operand1, operand2, division_result)
  case operator
  when '1'
    operand1.to_f + operand2.to_f
  when '2'
    operand1.to_f - operand2.to_f
  when '3'
    operand1.to_f * operand2.to_f
  when '4'
    division_result
  end
end

OPERATOR_NUM_TO_CHARACTER = {
  "1" => "+",
  "2" => "-",
  "3" => "*",
  "4" => "/"
}

def convert_operator_num_to_char(operator)
  OPERATOR_NUM_TO_CHARACTER[operator]
end

def display_result(message, verb, operator_character, num1, num2, result)
  if num2.to_i == 0
    result
  else
    prompt(format(message,
                  operator_verb: verb,
                  num1: num1,
                  operator_char: operator_character,
                  num2: num2,
                  result: result))
  end
end

def get_next_input(messages, lang)
  continue = ''
  loop do
    continue = gets.chomp.downcase
    break if continue == "y" || continue == "n"
    prompt(messages[lang]["continue_invalid"])
  end
  continue
end

# clear terminal output before starting the program
puts "\e[H\e[2J"

prompt(MESSAGES["welcome"])
prompt(MESSAGES["languages"])

raw_lang = get_language(MESSAGES)
lang = convert_raw_lang_input(raw_lang)

prompt(MESSAGES[lang]["instructions"])
prompt(MESSAGES[lang]["name"])

name = get_name(MESSAGES, lang)

prompt(format(MESSAGES[lang]["welcome_name"], name: name))

loop do
  prompt(MESSAGES[lang]["first_num"])
  num1 = get_input_num(MESSAGES, lang)
  prompt(MESSAGES[lang]["second_num"])
  num2 = get_input_num(MESSAGES, lang)

  prompt(MESSAGES[lang]["operations"])

  raw_operator = get_operator_input(MESSAGES, lang)
  operator = convert_raw_operator_input(raw_operator)

  desc_res_msg = MESSAGES[lang]["describe_result"]
  operator_verb = convert_operator_to_verb(operator, MESSAGES, lang)
  operator_char = convert_operator_num_to_char(operator)

  division_result = division(num1, num2, MESSAGES, lang, name)
  result = calculate_result(operator, num1, num2, division_result)

  display_result(desc_res_msg, operator_verb, operator_char, num1, num2, result)

  prompt(MESSAGES[lang]["continue_input"])
  continue = get_next_input(MESSAGES, lang)
  break unless continue == "y"

  # clear terminal output before starting next calculation if continuing
  puts "\e[H\e[2J"
  prompt(MESSAGES[lang]["next"])
end
prompt(format(MESSAGES[lang]["thanks"], name: name))
