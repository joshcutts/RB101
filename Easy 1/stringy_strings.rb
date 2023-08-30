=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, 
always starting with 1. The length of the string should match the given integer.

-  Inputs: integer
-  Output: string of "10" with length of the string matching the number

---

**Problem Domain:**

---

**Implicit Requirements:**

---

**Clarifying Questions:**

1.
2.
3.

---

**Mental Model:**


while the string length is less than the number
if the current length is even (or 0) add a 1
else add a 0  

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

-  Example 1
  -  Inputs: 6
  -  Output: "101010"
-  Example 2
  -  Inputs: 9
  -  Output: "101010101"
-  Example 3
  -  Inputs: 4
  -  Output: "1010"
 -  Example 4
  -  Inputs: 7
  -  Output: "1010101"

---

_Your Test Cases:_

-  Example 3
  -  Inputs:
  -  Output:

---

_Your Edge Cases:_

-  Example 4
  -  Inputs:
  -  Output:

---

Data Structure
--------------
just use strings, could use an array if having a hard time and join 
---

Algorithm
---------
while the string length is less than the number
if the current length is even (or 0) add a 1
else add a 0  

Code
----

=end

def stringy(num, start=1)
  str = ""

  if start == 1

    while str.length < num
      if str.length % 2 == 0 || str.length == 0
        str << "1"
      else
        str << "0"
      end
    end

  else

    while str.length < num
      if str.length % 2 == 0 || str.length == 0
        str << "0"
      else
        str << "1"
      end
    end
   
  end
  return str
end


puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts stringy(6, 0) == '010101'
puts stringy(9, 0) == '010101010'
puts stringy(4, 0) == '0101'
puts stringy(7, 0) == '0101010'
puts "test90"
puts 0.even?