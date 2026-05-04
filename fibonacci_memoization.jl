# Criamos o cache fora da função
const memo = Dict{Int, Int}()

function fib_manual(n)
    if n <= 1
        return n
    end
    
    # get!(dicionário, chave) do bloco de código se a chave não existir
    return get!(memo, n) do
        fib_manual(n - 1) + fib_manual(n - 2)
    end
end

@time println("Fibonacci(50): ", fib_manual(50))


using Pkg
# Caso não tenha o pacote: Pkg.add("Memoization")
using Memoization

@memoize function fib_expert(n)
    if n <= 1
        return n
    end
    return fib_expert(n - 1) + fib_expert(n - 2)
end

@time println("Fibonacci(100): ", fib_expert(100))