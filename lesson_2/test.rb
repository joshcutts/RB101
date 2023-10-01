OPERATOR_INPUT_TO_NUM = {
  "1" => ["1", "add", "addition", "+", "agregar", "hinzufügen"],
  "2" => ["2", "subtract", "subtraction", "-", "restar", "subtrahieren"],
  "3" => ["3", "multiply", "multiplication", "*", "multiplicar", "multiplizieren"],
  "4" => ["4", "divide", "division", "/", "dividir", "teilen"]
}

input = "multiply"

operator_hash = OPERATOR_INPUT_TO_NUM.select {|key, value| value.include?(input) }

p result_hash.keys[0]