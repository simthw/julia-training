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

# 
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