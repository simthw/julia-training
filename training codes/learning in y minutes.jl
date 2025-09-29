#= multiple comments
  by putting '#=' before and '=#' after
  after the code block
=#

######################################
# Learning Julia in Y minutes
######################################

# everything in julia is an expression
# several basic types of numbers
typeof(3) # Int64
typeof(3.0) # Float64
typeof(2 // 3) # Rational{Int64}

# normal operators
1 + 2
8 - 1
10 * 2
35 / 5 # division integers always results in float
div(5, 2)
5 \ 35 # left-division
12 % 10 # remainder, same as rem(12, 10)
