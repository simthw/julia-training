using OhMyREPL, Revise, Debugger

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

# julia中双引号表示字符串String，单引号表示字符Char
chars = ['H', 'E', 'L', 'L', 'O']
join(chars)
join('A':'G')
join('A':2:'G')

# collect函数
collect("HELLO")
collect(2:5)
collect('A':'G')

# tuple数据类型和array数据的区别
pizza_array = ["hawaiian", "S", 10.5]
pizza_array[1] = 42
pizza_array[3] = true # pizza_array数据类型为any，可更改为任意类型
# tuple数据不可更改
pizza_tuple = ("hawaiian", "S", 10.5)
pizza_tuple[1] = "hawa" # 报错，元组数据类型不可更改
for item in pizza_tuple
    println(item)
end
nums = (1, 3, 4, 6)
typeof(nums)
sum(nums)

# 看下面的例子，xs数组为Int64类型，不同类型转换时会报错
xs = Int64[3, 6, 8]
xs[1] = "hi"
typeof(pizza_tuple)

# 用元组表示销售数据
sales = [
    ("hawaiian", 'S', 10.5),
    ("sicilian", 'S', 12.25),
    ("hawaiian", 'L', 16.5),
    ("bbq chicken", 'L', 20.75),
    ("bbq chicken", 'M', 16.75)
]
name(pizza) = pizza[1]
portion(pizza) = pizza[2]
price(pizza) = pizza[3]
map(name, sales)

# predicate的应用
filter(iseven, 1:10)

# pizza数据中定义predicate
issmall(pizza) = portion(pizza) == 'S'
islarge(pizza) = portion(pizza) == 'L'
isbbq(pizza) = name(pizza) == "bbq chicken"

## 卖出large pizza的总价钱
filter(islarge, sales) # 找出尺寸large的pizza
map(price, filter(islarge, sales)) # 找出尺寸large的pizza的价格
sum(map(price, filter(islarge, sales))) # 计算尺寸large的pizza的总价钱

## 卖出bbq chicken pizza的总价钱
bbq_sales = filter(isbbq, sales)
sum(map(price, bbq_sales))
# 加和的另一种表达方式
mapreduce(price, +, bbq_sales)

# 自定义sine函数
function sine(x)
    n = 5
    total = 0
    for i in 0:n
        total += (-1)^i * x^(2i + 1) / factorial(2i + 1)
    end
    total
end
# sine函数用mapreduce函数表达
function sinus(x)
    n = 5
    taylor(i) = (-1)^i * x^(2i + 1) / factorial(2i + 1)
    mapreduce(taylor, +, 0:n)
end