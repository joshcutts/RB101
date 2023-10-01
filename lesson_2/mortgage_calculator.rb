# mortgage_calculator.rb

def prompt(message)
  puts "=> #{message}"
end

prompt("Welcome to Mortgage Calculator!")
prompt("I'll need a couple pieces of information from you about your mortgage,")
prompt("Then I can calculate your monthly payment for you!")

# method to determine if a number from gets (string) is a valid integer
def valid_int?(num)
  num.to_i.to_s == num
end

# method to determine if a number from gets (string) is a valid float
# should accomodate floats that end in 1 or 2 "0"s
def valid_float?(str_float)
  (str_float.to_f.to_s == str_float) || (str_float.to_f.to_s == str_float.chomp('0')) || (str_float.to_f.to_s == str_float.chomp('.00'))
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
  valid_number?(loan_amount) && loan_amount.to_i > 0 && loan_amount =~ /^\d+(\.\d{0,2})?$/
end

loop do
  loan_amount = ''
  loop do
    prompt("What is the loan amount in dollars?")
    print "$"
    loan_amount = gets.chomp().delete(",")
    break if valid_loan_amount?(loan_amount)
    prompt("Must enter a valid dollar amount")
  end

  # defining function to test for valid percentage for apr. It tests for 3 things
  # 1) should be a valid number (can be integer or float)
  # 2) should be greater than 0 but less than or equal to 100
  # 3) can have up to 2 decimal points or whole number (regex)
  def valid_percent?(percent)
    valid_number?(percent) && percent.to_f.between?(0, 100) && percent =~ /^\d+(\.\d{0,2})?$/
  end

  apr = ''
  loop do
    prompt("What is the Annual Percentage Rate (APR).")
    apr = gets.chomp()
    break if valid_percent?(apr)
    prompt("Input a valid percentage between 1% and 100%")
  end

  duration_years = ''
  loop do
    prompt("What is the loan duration in years?")
    duration_years = gets.chomp()
    if valid_int?(duration_years) != true
      prompt("Invalid years. Input valid loan duration in years.")
    elsif duration_years.to_i < 0
      prompt("Loan duration can't be negative. Input valid loan duration in years.")
    elsif duration_years.to_i > 30
      prompt("Loan duration >30 is unusual and invalid. Input valid loan duration in years.")
    else
      break
    end
  end

  monthly_rate = (apr.to_f / 12) / 100

  duration_months = duration_years.to_i * 12

  monthly_payment = loan_amount.to_f * (monthly_rate / (1 - ((1 + monthly_rate)**(-duration_months))))

  # function to format numbers so there are "," in appropriate location
  def format_number(number)
    whole, decimal = number.to_s.split(".")
    num_groups = whole.chars.to_a.reverse.each_slice(3)
    whole_with_commas = num_groups.map(&:join).join(',').reverse
    [whole_with_commas, decimal].compact.join(".")
  end

  prompt("For the following paramters
    Loan Amount:            $#{format_number(loan_amount)}
    APR:                    #{format('%.2f', apr)}%
    Loan Duration (years):  #{duration_years}")
  prompt("Your monthly payment is $#{format_number(format('%.2f', monthly_payment))}")

  # calculating lifetime interest of the loan
  lifetime_interest =  (monthly_payment * duration_months) - loan_amount.to_f

  # Telling user the lifetime interest if they care to know

  prompt("Do you want to know how much interest you will pay over the lifetime of the loan? (Y/N)")
  loop do
    response = gets.chomp
    if response.downcase == "y"
      prompt("Over the lifetime of the loan you will pay $#{format_number(format('%.2f', lifetime_interest))} in interest")
      break
    elsif response.downcase == "n"
      break
    else
      prompt("Invalid response. Please input either N to exit or Y to continue.")
    end
  end

  prompt("Do you want to calculate a monthly payment with different parameters? (Y/N)")
  continue = ''
  loop do
    continue = gets.chomp
    if continue.downcase == "y" || continue.downcase == "n"
      break
    else
      prompt("Invalid response. Please input either N to exit or Y to continue.")
    end
  end
  break unless continue.downcase == "y"
end
prompt("Thanks for using this Mortgage Calculator! Come back again!")
