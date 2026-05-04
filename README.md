# Julia — Fundamentos

Uma introdução rápida à linguagem de programação Julia.

## O que é Julia?

Julia é uma linguagem de programação de alto desempenho, dinâmica e de propósito geral, projetada especialmente para computação numérica e científica. Ela combina a produtividade de linguagens dinâmicas (como Python) com a velocidade próxima de C/Fortran em muitos cenários.

## Por que usar Julia?

- **Alto desempenho**: compilação Just-In-Time (JIT) via LLVM.
- **Sintaxe expressiva**: clara e concisa, fácil para matemática e algoritmos.
- **Ecosistema científico**: pacotes para álgebra linear, otimização, DataFrames, visualização e mais.

## Exemplo rápido

Crie um arquivo chamado [fibonacci.jl](fibonacci.jl) (já existe neste repositório) com o seguinte conteúdo:

```julia
# Olá, mundo
println("Olá, mundo!")

# Função simples para calcular o n-ésimo termo da sequência de Fibonacci
function fib(n)
	a, b = 0, 1
	for i in 1:n
		a, b = b, a + b
	end
	return a
end

println("fib(10) = ", fib(10))
```

Execute o exemplo no terminal:

```
julia fibonacci.jl
```

Ou entre no REPL interativo com:

```
julia
```

## Instalação

Baixe Julia em https://julialang.org/downloads/ e siga as instruções para seu sistema operacional. Após instalar, verifique com:

```
julia --version
```

## Próximos passos

- Explore o REPL e os pacotes com `using Pkg` e `Pkg.add("PackageName")`.
- Experimente operações com arrays, compreensão de listas e chamadas a funções nativas de álgebra linear.
- Consulte a documentação oficial: https://docs.julialang.org/

Boa exploração! 🚀