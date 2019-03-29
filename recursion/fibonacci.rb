def fibonacci(n)
    return "ERROR: Negative index!" if n < 0
    return n if n <= 1
    fibonacci(n-1) + fibonacci(n-2)
end

#0, 1, 1, 2, 3, 5, 8, 13, 21...
puts fibonacci(0)
puts fibonacci(5)
puts fibonacci(6)
puts fibonacci(7)