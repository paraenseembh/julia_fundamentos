function fibonacci(n)
    if n <= 0
        return 0
    elseif n == 1
        return 1
    else
        return fibonacci(n - 1) + fibonacci(n - 2)
    end
end

# Testando o código
n = 10
println("O $n-ésimo termo da sequência de Fibonacci é: ", fibonacci(n))