# mortgage_calculator.rb
# needed to change directory on my system to access yaml
# adjust as necessary
Dir.chdir("./lesson_2/mortgage_calculator")
require "yaml"
MESSAGES = YAML.safe_load(File.read("messages_yaml.yml"))
MONTHS_IN_YEAR = 12

def prompt(message)
  puts "=> #{message}"
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

# method to determine if a number from gets (string) is a valid integer
def valid_int?(num)
  num.to_i.to_s == num
end

# method to determine if a number from gets (string) is a valid float
# should accomodate floats that end in 1 or 2 "0"s
def valid_float?(num)
  (num.to_f.to_s == num.chomp('0')) || (num.to_f.to_s == num.chomp('.00'))
end

# combining the valid_integer? and valid_float methods to test for valid num
def valid_number?(num)
  valid_int?(num) || valid_float?(num)
end

# defining function to test for valid loan amount. It tests for 3 things
# 1) should be a valid number (can be integer or float)
# 2) should be greater than 0
# 3) can have up to 2 decimal points (within valid_float method)
# needed the regex in the valid_float? method or that method would fail if num
# ended in "0"
def valid_loan_amount?(loan_amount)
  condition1 = valid_number?(loan_amount)
  condition2 = loan_amount.to_i > 0
  condition3 = loan_amount =~ /^\d+(\.\d{0,2})?$/

  condition1 && condition2 && condition3
end

def get_loan_amount(messages)
  loan_amount = ''
  loop do
    prompt(format(messages["loan_prompt"],
                  currency_word: messages["currency_word"]))
    print(messages["currency"])
    loan_amount = gets.chomp().delete("$,")
    break if valid_loan_amount?(loan_amount)
    prompt(format(messages["valid_dollars"],
                  currency_word: messages["currency_word"]))
  end
  loan_amount
end

# defining function to test for valid percentage for apr. It tests for 3 things
# 1) should be a valid number (can be integer or float)
# 2) should be greater than 0 but less than or equal to 100
# 3) can have up to 2 decimal points or whole number (regex)
def valid_apr?(percent)
  condition1 = valid_number?(percent)
  condition2 = percent.to_f.between?(0.01, 100)
  condition3 = percent =~ /^\d+(\.\d{0,2})?$/

  condition1 && condition2 && condition3
end

def get_apr(messages)
  apr = ''
  loop do
    prompt(messages["interest_prompt"])
    apr = gets.chomp().delete("%")
    break if valid_apr?(apr)
    prompt(messages["invalid_interest"])
  end
  apr
end

def valid_duration?(duration_years, messages)
  if valid_int?(duration_years) != true
    prompt(messages["invalid_years"])
  elsif duration_years.to_i <= 0
    prompt(messages["negative_duration"])
  elsif duration_years.to_i > 30
    prompt(messages["invalid_long_loan"])
  else
    return true
  end
  false
end

def get_loan_duration(messages)
  duration_years = ''
  loop do
    prompt(messages["duration_prompt"])
    duration_years = gets.chomp()
    break if valid_duration?(duration_years, messages)
  end
  duration_years
end

def calculate_monthly_payment(loan, interest_rate, duration_years)
  monthly_rate = (interest_rate.to_f / MONTHS_IN_YEAR) / 100
  months = duration_years.to_i * MONTHS_IN_YEAR
  loan.to_f * (monthly_rate / (1 - ((1 + monthly_rate)**(-months))))
end

# function to format numbers so there are "," in appropriate location
def format_number(number)
  whole, decimal = number.to_s.split(".")
  num_groups = whole.chars.to_a.reverse.each_slice(3)
  whole_with_commas = num_groups.map(&:join).join(',').reverse
  [whole_with_commas, decimal].compact.join(".")
end

def display_parameters(loan_amount, interest_rate, duration_years, messages)
  formatted_loan = format_number(loan_amount)
  formatted_interest = format('%.2f', interest_rate)
  prompt(format(messages["parameters"],
                currency: messages["currency"],
                loan: formatted_loan,
                interest: formatted_interest,
                years: duration_years))
end

def display_monthly_payment(monthly_payment, messages)
  formatted_monthly_payment = format_number(format('%.2f', monthly_payment))
  prompt(format(messages["monthly_payment"],
                currency: messages["currency"],
                payment: formatted_monthly_payment))
end

def calculate_lifetime_interest(monthly_payment, duration_years, loan_amount)
  duration_months = duration_years.to_i * 12
  (monthly_payment * duration_months) - loan_amount.to_f
end

def get_yes_no_input(messages)
  continue = ''
  loop do
    continue = gets.chomp.downcase
    break if continue == "y" || continue == "n"
    prompt([messages["invalid_input"]])
  end
  continue
end

def display_lifetime_interest(lifetime_interest, messages)
  display = get_yes_no_input(messages)
  format_life_interest = format_number(format('%.2f', lifetime_interest))
  if display == "y"
    prompt(format(messages["lifetime_statement"],
                  currency: messages["currency"],
                  life_interest: format_life_interest))
  end
end

system("clear")
prompt(MESSAGES["welcome"])
prompt(MESSAGES["languages"])
lang = get_language(MESSAGES)
translation = MESSAGES[lang]

prompt(translation["instructions1"])
prompt(translation["instructions2"])

loop do
  loan = get_loan_amount(translation)
  apr = get_apr(translation)
  duration_years = get_loan_duration(translation)

  monthly_payment = calculate_monthly_payment(loan, apr, duration_years)

  display_parameters(loan, apr, duration_years, translation)
  display_monthly_payment(monthly_payment, translation)
  sleep(2)

  prompt(translation["lifetime_prompt"])
  lifetime_interest = calculate_lifetime_interest(monthly_payment,
                                                  duration_years,
                                                  loan)
  display_lifetime_interest(lifetime_interest, translation)

  prompt(translation["another_loan"])
  continue = get_yes_no_input(translation)
  break unless continue.downcase == "y"
  system("clear")
end
prompt(translation["goodbye"])
