def fact(n)
    return 0 if n < 0
    return 1 if n <= 1
    n * fact(n - 1)
end

puts fact(0) # => 1
puts fact(3) # => 6
puts fact(4) # => 24