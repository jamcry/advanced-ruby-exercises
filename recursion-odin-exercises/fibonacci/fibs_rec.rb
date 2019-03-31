def fibs(n, seq = [0])
  # Base case
  return seq if seq.length == n
    
  seq << 1 if seq[-1] == 0
    
  # Recursive calls
  fibs(n-1, seq) << seq[-1] + seq[-2]
end

p fibs(1)  # => [0]
p fibs(3)  # => [0, 1, 1]
p fibs(5)  # => [0, 1, 1, 2, 3]
p fibs(13) # => [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]
