# if the array has two or fewer values, return the largest value
# else if the array has more than two values,
#       split it into two arrays
#       call the method dwo more times

def rock_judger(rocks)
    len = rocks.length
    if len <= 2 # the base case
        a = rocks[0]
        b = rocks[-1]
    else
        # cut the first half of the array and pass it to the method
        a = rock_judger(rocks.slice(0, len / 2))
        # pass the remaining part (second half) of the array to the method
        b = rock_judger(rocks.slice(len / 2, len))
    end

    # return the largest value
    (a > b) ? a : b
end

def short_rock_judger(rocks)
"""
Since this function uses Array#pop to subdivide arrays,
The original array is modified at the end.
"""
    count = rocks.length
    a, b = count <= 2 ? [rocks[0], rocks[-1]] : [short_rock_judger(rocks.pop(count / 2)), short_rock_judger(rocks)]
    a > b ? a : b
end
rocks = 10.times.map { rand(200) + 1 }
puts rocks.join(", ")
puts "Heaviest: #{rock_judger(rocks)}"
puts "Main array: #{rocks}"
puts "Heaviest: #{short_rock_judger(rocks)} (short)"
puts "Main array: #{rocks}"