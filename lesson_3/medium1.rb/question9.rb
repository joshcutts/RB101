# question9.rb

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

#no is returned by bar(foo)
# this is because the return of foo with no parameter is yes
# so bar("yes") is being evaluated. Since the ternary expression evaluations
# to false ("yes" == "no" evaluates to false) "no" of the ternary is returned

p bar(foo)