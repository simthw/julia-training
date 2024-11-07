# if-else statement 
function fac(n)
    if n > 2 # check if n >2
        n * fac(n - 1)
    elseif n > 0 # add condition check if n >0
        return n
    elseif n == 0 # add condition check if n == 0 
        return 1
    else
        return err = DomainError(n, "`n` must not be negative")
    end
end
fac(5)

# try-catch statement
function alpha()
    try
        beta()
    catch e
        #handle exception
    end
end

# function fib()
function fib(n)
    if n > 1
        return fib(n - 1) + fib(n - 2)
    elseif n == 0
        return 0
    elseif n == 1
        return 1
    else
        return e
    end
end

## recursion way, avoid recursion running 
function fib(n)
    if 0 <= n <= 1 # define base condition
        return n
    else
        return fib(n - 1) + fib(n - 2)
    end
end
# iteration way, 迭代for loop
function fubi(n)
    if 0 <= n <= 1
        return n
    end
    prev = 0
    x = 1
    for i in 2:n
        tmp = x
        x += prev
        prev = tmp
    end
    x
end

## chapter 4 julia as a spreadsheet
using Statistics
# vector
amounts = [4, 1, 5, 3, 2] # column vector, using a comma
amounts[1] # access the first element
amounts[begin]
amonuts[end] # access the last element
row = [4 1 5 3 2] # row vector, using a space
# matrix
pizzas = [4 15.0; #semicolon to seperate rows
    1 11.5;
    5 13.0;
    3 12.75;
    2 14.25]
prices = [15.0, 11.5, 13.0, 12.75, 14.25]
sort(prices)
prices # sort function does not modify the original array
sort!(prices)
prices # sort! function modify the original array
# two columns multiplication
amounts .* prices
# n random numbers between 0 and 1, prefix with array type
rand(Float64, 5) # create 5 random 64-bit signed floating-point numbers

# map() function, example
function print_sin_table(increment, max_angle)
    angle = 0
    while angle <= max_angle
        rad = deg2rad(angle)
        x = sin(rad)
        println(x)
        angle = angle + increment
    end
end
# map(),take other functions as arguments and/or return functions
rads = map(deg2rad, 0:15:90)
sin_table = map(sin, map(deg2rad, 0:15:90))
#
function transform(fun, xs)
    ys = [] # an empty array to hold result
    for x in xs
        push!(ys, fun(x)) # transfromed element to the result array ys 
    end
    return ys # final result
end
