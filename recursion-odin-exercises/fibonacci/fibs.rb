def fibs(n)
    n -= 1
    fb = [0]
    fb << 1 if n > 0
    (n-1).times do
        fb << fb[-1] + fb[-2]
    end
    return fb
end

p fibs(1) # => 0
p fibs(2) # => 0, 1, 1
p fibs(6) # => 0, 1, 1, 2, 3, 5, 8