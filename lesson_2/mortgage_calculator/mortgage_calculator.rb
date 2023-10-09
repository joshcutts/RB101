# mortgage_calculator.rb
# needed to change directory on my system to access yaml
# adjust as necessary
Dir.chdir("./lesson_2/mortgage_calculator")
require "yaml"
MESSAGES = YAML.safe_load(File.read("messages_yaml.yml"))
MONTHS_IN_YEAR = 12
LANGUAGE_CONVERSION_HASH = MESSAGES["lang_conversion"]

def prompt(message)
  puts "=> #{message}"
end

def get_language(messages)
  language = ""
  loop do
    language = gets.chomp.downcase
    break if LANGUAGE_CONVERSION_HASH.keys.include?(language)
    prompt(messages["invalid_language"])
    prompt(messages["languages"])
  end
  convert_raw_lang_input(language)
end

def convert_raw_lang_input(input)
  LANGUAGE_CONVERSION_HASH[input]
end

def valid_int?(num)
  num.to_i.to_s == num
end

def valid_float?(num)
  (num.to_f.to_s == num.chomp('0')) || (num.to_f.to_s == num.chomp('.00'))
end

def valid_number?(num)
  valid_int?(num) || valid_float?(num)
end

def valid_loan_amount?(loan_amount)
  valid_num = valid_number?(loan_amount)
  positive = loan_amount.to_i > 0
  two_decimals = loan_amount =~ /^\d+(\.\d{0,2})?$/

  valid_num && positive && two_decimals
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

def valid_duration_months?(duration_months, messages)
  if valid_int?(duration_months) != true
    prompt(messages["invalid_months"])
  elsif duration_months.to_i <= 0
    prompt(messages["negative_duration_months"])
  elsif duration_months.to_i > (30 * MONTHS_IN_YEAR)
    return unusual_loan_duration(messages)
  else
    return true
  end
  false
end

def unusual_loan_duration(messages)
  prompt(messages["duration_confirm"])
  continue = get_yes_no_input(messages)
  return true if continue.start_with?("y")
  false
end

def valid_duration_years?(duration_years, messages)
  if valid_int?(duration_years) != true
    prompt(messages["invalid_years"])
  elsif duration_years.to_i <= 0
    prompt(messages["negative_duration_years"])
  elsif duration_years.to_i > 30
    return unusual_loan_duration(messages)
  else
    return true
  end
  false
end

def months_or_years(messages)
  prompt(messages["months_or_years"])
  units = ""
  loop do
    units = gets.chomp.downcase
    break if units.start_with?("m") || units.start_with?("y")
    prompt(messages["invalid_months_or_years"])
  end
  units
end

def get_months(messages)
  duration_months = ''
  loop do
    prompt(messages["duration_prompt_months"])
    duration_months = gets.chomp()
    break if valid_duration_months?(duration_months, messages)
  end
  duration_months
end

def get_years(messages)
  duration_years = ''
  loop do
    prompt(messages["duration_prompt_years"])
    duration_years = gets.chomp()
    break if valid_duration_years?(duration_years, messages)
  end
  duration_years
end

def get_loan_duration(messages)
  unit = months_or_years(messages)
  if unit.start_with?("m")
    duration = get_months(messages)
  else
    duration = get_years(messages)
    duration = (duration.to_i * MONTHS_IN_YEAR).to_s
  end
  duration
end

def calculate_monthly_payment(loan, interest_rate, months)
  monthly_rate = (interest_rate.to_f / MONTHS_IN_YEAR) / 100
  loan.to_f * (monthly_rate / (1 - ((1 + monthly_rate)**(-months.to_i))))
end

def format_number(number)
  whole, decimal = number.to_s.split(".")
  num_groups = whole.chars.to_a.reverse.each_slice(3)
  whole_with_commas = num_groups.map(&:join).join(',').reverse
  [whole_with_commas, decimal].compact.join(".")
end

def display_parameters(loan_amount, interest_rate, months, messages)
  formatted_loan = format_number(loan_amount)
  formatted_interest = format('%.2f', interest_rate)
  if months.to_i % MONTHS_IN_YEAR == 0
    duration_years = (months.to_i / MONTHS_IN_YEAR).to_s
  else
    duration_years = (months.to_f / MONTHS_IN_YEAR).round(2).to_s
  end
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

def calculate_lifetime_interest(monthly_payment, duration_months, loan_amount)
  (monthly_payment * duration_months.to_i) - loan_amount.to_f
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

def display_lifetime_interest(lifetime_interest, messages)
  format_life_interest = format_number(format('%.2f', lifetime_interest))
  prompt(format(messages["lifetime_statement"],
                currency: messages["currency"],
                life_interest: format_life_interest))
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
  duration_months = get_loan_duration(translation)

  monthly_payment = calculate_monthly_payment(loan, apr, duration_months)

  display_parameters(loan, apr, duration_months, translation)
  display_monthly_payment(monthly_payment, translation)
  sleep(2)

  prompt(translation["lifetime_prompt"])
  display = get_yes_no_input(translation)
  if display.start_with?("y")
    lifetime_interest = calculate_lifetime_interest(monthly_payment,
                                                    duration_months,
                                                    loan)
    display_lifetime_interest(lifetime_interest, translation)
  end

  prompt(translation["another_loan"])
  continue = get_yes_no_input(translation)
  break unless continue.downcase.start_with?("y")
  system("clear")
end
prompt(translation["goodbye"])
