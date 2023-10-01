=begin

PEDAC Template
==============

(Understand the) Problem
------------------------
Write a method that takes one integer argument, which may be positive, negative, or zero. 
This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

-  Inputs: any positive, negative integer or 0
-  Output: true if the value is odd. false if even or 0

---

**Problem Domain:**

---

**Implicit Requirements:**
false if even or 0
---

**Clarifying Questions:**

1. may assume that the argument is a valid integer value
2.
3.

---

**Mental Model:**

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

-  Example 1
  -  Inputs: 2
  -  Output: false
-  Example 2
  -  Inputs: 5
  -  Output: true
-  Example 3
  -  Inputs: -17
  -  Output: true
-  Example 4
  -  Inputs: -8
  -  Output: false
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
none required
---

Algorithm
---------

simple if statement. If % 2 is not (!=) equal to 0 then true, else false. special case 0 returns false

Code
----

=end

def is_odd?(num)
  num.remainder(2) != 0
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true