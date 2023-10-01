# question7.rb

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# yes
=begin

in Ruby what gets passed to the method isn't the value of the object. under the hood, Ruby
passes the object_id of each argument to the method. The method stores these object_id's
internally in locally scoped (private tot eh method) variables (named per the method
definition's parameter list).

So Spot's demo_hash is pointing to the munsters hash. In this case the program
does not create a new hash for the result it just uses the existing hash as is
So the actual hash object that is being messed with inside
the method is the munsters hash

=end

mess_with_demographics(munsters)
p munsters
