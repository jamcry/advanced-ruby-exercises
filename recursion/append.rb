def append(arr, n)
    return arr if n < 0 # base case
    arr << n
    append(arr, n-1)
end

def reverse_append(arr, n)
    return arr if n < 0 # base case
    reverse_append(arr, n-1)
    arr << n
end
p append([], 3) # => [3, 2, 1, 0]
p append([], 2) # => [2, 1, 0]
p append([], 1) # => [1, 0]
p append([], 0) # => [0]
p reverse_append([], -1) # => []
p reverse_append([], 0) # => [0]
p reverse_append([], 1) # => [0, 1]
p reverse_append([], 2) # => [0, 1, 2]
p reverse_append([], 3) # => [0, 1, 2, 3]