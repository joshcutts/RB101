# question3.rb

def tricky_method(string_param_one, string_param_two)
  string_param_one += "rutabaga"
  string_param_two << "rutabaga"
end

string_arg_one = "pumpkins"
string_arg_two = "pumpkins"
tricky_method(string_arg_one, string_arg_two)

puts "String_arg_one looks like this now: #{string_arg_one}" # pumpkins
puts "String_arg_two looks like this now: #{string_arg_two}" # pumpkinsrutabaga

# string_arg_one is not mutated since "+=" is not a mutating method thus 
# "pumpkins" is returned as the original string is not modified by the method
#
# while string_arg_two is mutated since "<<" is a mutating method
# the object string_arg_two is mutated by "<<" and the method mutates the original
# "pumpkins" object to return "pumpkinsrutabaga"