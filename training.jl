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