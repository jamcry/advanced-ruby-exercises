def sum_upto(n)
    n == 1 ? 1 : (sum_upto(n-1) + n)
    # base case is when n is equal to 1
end

puts sum_upto(3)

# (sum_upto(3))  = ( (    sum_upto(2)    ) + 3 )
#                = ( ( (sum_upto(1)) + 2 ) + 3 )
#                = ( ( (1)           + 2 ) + 3 )
#                = 6