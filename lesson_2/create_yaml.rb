# create_yaml.rb

require "yaml"

messages = {
  "1" => "=> Welcome to Calculator!",
  "2" => "=> What is your name?",
  "lang_conversion": {"1" => "en", "english" => "en", "en" => "en", "2" => "es", "spanish" => "es", "español" => "es", "es" => "es", "3" => "de", "German" => "de", "deutsch" => "de", "de" => "de"},
  "3" => "=> Must input a valid name. Try again.",
  "4" => "=> Welcome %{name}",
  "5" => "=> What's the first number?",
  "6" => "=> Please input a valid number.",
  "7" => "=> What's the second number?",
  "8" => "What operation would you like to perform?
  1) add
  2) subtract
  3) multiply
  4) divide",
  "9" => "Please select a valid operator: 1, 2, 3 or 4",
  "10" => "%{op_to_message} the two numbers: %{num1} %{char_op} %{num2}",
  "11" => "The result is %{result}",
  "12" => "Input Y to perform another operation.",
  "13" => "Thanks for using the calculator. Good bye!"
}

File.open("./lesson_2/mortgage_calculator/messages_yaml_test.yml", "w") { |file| file.write(messages.to_yaml) }
