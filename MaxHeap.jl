using DataStructures

# Criando um maxHeap (usando reversão de ordem)
max_heap = BinaryMaxHeap{Int}()

# Inserindo elementos
push!(max_heap, 5)
push!(max_heap, 3)
push!(max_heap, 8)
push!(max_heap, 1)
push!(max_heap, 10)

println("MaxHeap: ", max_heap)
println("Maior elemento: ", first(max_heap))

# Removendo o maior elemento
maior = pop!(max_heap)
println("Removido: ", maior)
println("MaxHeap após remoção: ", max_heap)

# fazendo do zero:
mutable struct MaxHeap
    heap::Vector{Int}
    size::Int
    
    function MaxHeap()
        new(Int[], 0)
    end
end

# Funções auxiliares
function parent(i::Int)
    return i ÷ 2
end

function left_child(i::Int)
    return 2 * i
end

function right_child(i::Int)
    return 2 * i + 1
end

# Inserir elemento
function insert!(h::MaxHeap, value::Int)
    push!(h.heap, value)
    h.size += 1
    sift_up!(h, h.size)
end

# Subir o elemento para manter a propriedade do heap
function sift_up!(h::MaxHeap, index::Int)
    while index > 1 && h.heap[parent(index)] < h.heap[index]
        h.heap[parent(index)], h.heap[index] = h.heap[index], h.heap[parent(index)]
        index = parent(index)
    end
end

# Extrair o máximo
function extract_max!(h::MaxHeap)
    if h.size == 0
        throw(ArgumentError("Heap vazio!"))
    end
    
    max_val = h.heap[1]
    h.heap[1] = h.heap[end]
    pop!(h.heap)
    h.size -= 1
    
    if h.size > 0
        sift_down!(h, 1)
    end
    
    return max_val
end

# Descer o elemento
function sift_down!(h::MaxHeap, index::Int)
    max_index = index
    left = left_child(index)
    right = right_child(index)
    
    # Verificar filho esquerdo
    if left ≤ h.size && h.heap[left] > h.heap[max_index]
        max_index = left
    end
    
    # Verificar filho direito
    if right ≤ h.size && h.heap[right] > h.heap[max_index]
        max_index = right
    end
    
    # Se necessário, trocar e continuar
    if index != max_index
        h.heap[index], h.heap[max_index] = h.heap[max_index], h.heap[index]
        sift_down!(h, max_index)
    end
end

# Verificar o máximo sem remover
function peek(h::MaxHeap)
    if h.size == 0
        throw(ArgumentError("Heap vazio!"))
    end
    return h.heap[1]
end

# Construir heap a partir de array
function build_heap!(arr::Vector{Int})
    h = MaxHeap()
    h.heap = copy(arr)
    h.size = length(arr)
    
    # Começar do último nó não-folha
    for i in (h.size ÷ 2):-1:1
        sift_down!(h, i)
    end
    
    return h
end


# Testando a implementação
println("=== Criando MaxHeap vazio ===")
h = MaxHeap()
println("Heap vazio criado: ", h.heap)

# Inserindo elementos
println("\n=== Inserindo elementos ===")
for val in [5, 3, 8, 1, 10, 7, 6]
    insert!(h, val)
    println("Inserido $val: ", h.heap)
end

println("\n=== Consultando máximo ===")
println("Máximo atual: ", peek(h))

println("\n=== Extraindo elementos ===")
while h.size > 0
    max_val = extract_max!(h)
    println("Extraído: $max_val, Heap: ", h.heap)
end

# Construindo heap a partir de array
println("\n=== Construindo heap a partir de array ===")
arr = [4, 10, 3, 5, 1, 8, 7]
heap_from_array = build_heap!(arr)
println("Array original: ", arr)
println("MaxHeap construído: ", heap_from_array.heap)

# Extraindo todos os elementos (ordem decrescente)
println("\nElementos em ordem decrescente:")
while heap_from_array.size > 0
    print(extract_max!(heap_from_array), " ")
end
println()
