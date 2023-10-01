# calculator.rb

def calculator()
  puts "This is a calculator that will add, subtract, multiply or divide 2 numbers"
  puts "Please select the first number you would like to perform an operation on."
  num1 = gets.chomp.to_f
  puts "Please select the second number you would like to perform an operation on."
  num2 = gets.chomp.to_f

  puts "Please select an operation - 'add' 'subtract' 'multiply' or 'divide'"
  operation = gets.chomp

  case(operation)
  when "divide" || "division"
    answer = num1 / num2
  when "multiply" || "multiplication"
    answer = num1 * num2
  when "add" || "addition"
    answer = num1 + num2
  when "subtract" || "subtraction"
    answer = num1 - num2
  end
  p answer
end

calculator()