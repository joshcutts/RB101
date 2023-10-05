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
  convert_raw_lang_input(language)
end

def convert_raw_lang_input(input)
  language_conversion_hash = {
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

  language_conversion_hash[input]
end

def get_name(translation)
  name = gets.chomp
  loop do
    if name.strip.empty?
      prompt(translation["valid_name"])
    else
      break
    end
  end
  name
end

def get_input_num(translation)
  num = ""
  loop do
    num = gets.chomp
    break if valid_number?(num)
    prompt(translation["valid_num"])
  end
  num
end

def get_operator_input(translation)
  operator = ''

  valid_add = translation["valid_add"]
  valid_subtract = translation["valid_subtract"]
  valid_mult = translation["valid_mult"]
  valid_div = translation["valid_div"]

  valid_op = valid_add + valid_subtract + valid_mult + valid_div
  loop do
    operator = gets.chomp.downcase
    break if valid_op.include?(operator)
    prompt(translation["valid_operator"])
  end
  operator
end

def convert_raw_operator_input(input, translation)
  operator_input_to_num = {
    "1" => translation["valid_add"],
    "2" => translation["valid_subtract"],
    "3" => translation["valid_mult"],
    "4" => translation["valid_div"]
  }

  operator_hash = operator_input_to_num.select do |_key, value|
    value.include?(input)
  end
  operator_hash.keys[0]
end

def get_operator(translation)
  raw_operator = get_operator_input(translation)
  convert_raw_operator_input(raw_operator, translation)
end

def convert_operator_to_verb(operator, translation)
  operator_to_verb = {
    "1" => translation["Adding"],
    "2" => translation["Subtracting"],
    "3" => translation["Multiplying"],
    "4" => translation["Dividing"]
  }
  operator_to_verb[operator]
end

def division(operand1, operand2)
  if operand2.to_i == 0
    :divide_by_zero
  else
    operand1.to_f / operand2.to_f
  end
end

def calculate_result(operator, operand1, operand2)
  case operator
  when '1'
    operand1.to_f + operand2.to_f
  when '2'
    operand1.to_f - operand2.to_f
  when '3'
    operand1.to_f * operand2.to_f
  when '4'
    division(operand1, operand2)
  end
end

def convert_operator_num_to_char(operator)
  operator_num_to_character = {
    "1" => "+",
    "2" => "-",
    "3" => "*",
    "4" => "/"
  }

  operator_num_to_character[operator]
end

def create_res_str_words(message, verb)
  format(message, operator_verb: verb)
end

def create_res_str_nums(message, num1, num2, operator_char, result)
  format(message,
         num1: num1,
         operator_char: operator_char,
         num2: num2,
         result: result)
end

def generate_final_result_string(words, nums)
  words + nums
end

def display_result(result, result_string, translation, name)
  if result == :divide_by_zero
    return prompt(format(translation["zero_division"], name: name))
  else
   prompt(result_string)
  end
end

def get_next_input(translation)
  continue = ''
  loop do
    continue = gets.chomp.downcase
    break if continue == "y" || continue == "n"
    prompt(translation["continue_invalid"])
  end
  continue
end

# clear terminal output before starting the program
puts "\e[H\e[2J"

prompt(MESSAGES["welcome"])
prompt(MESSAGES["languages"])

lang = get_language(MESSAGES)

translated_message = MESSAGES[lang]

prompt(translated_message["instructions"])
prompt(translated_message["name"])

name = get_name(translated_message)

prompt(format(translated_message["welcome_name"], name: name))

loop do
  prompt(translated_message["first_num"])
  num1 = get_input_num(translated_message)
  prompt(translated_message["second_num"])
  num2 = get_input_num(translated_message)

  prompt(translated_message["operations"])

  operator = get_operator(translated_message)

  operator_verb = convert_operator_to_verb(operator, translated_message)
  operator_char = convert_operator_num_to_char(operator)

  result = calculate_result(operator, num1, num2)

  result_msg_words = translated_message["describe_result_words"]
  words = create_res_str_words(result_msg_words, operator_verb)

  result_msg_nums = translated_message["describe_result_nums"]
  nums = create_res_str_nums(result_msg_nums, num1, num2, operator_char, result)

  final_string = generate_final_result_string(words, nums)
  display_result(result, final_string, translated_message, name)

  prompt(translated_message["continue_input"])
  continue = get_next_input(translated_message)
  break unless continue == "y"

  # clear terminal output before starting next calculation if continuing
  puts "\e[H\e[2J"
  prompt(translated_message["next"])
end
prompt(format(translated_message["thanks"], name: name))
