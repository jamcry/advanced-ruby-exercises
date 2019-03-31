def mergesort(array)
    len = array.length
    # Base case
    return array if len <= 1
    
    # Divide array into smaller arrays and merge sort them
    a = mergesort(array[0...(len / 2)])
    
    b = mergesort(array[(len / 2)..])

    # Merge sub-arrays into new array "sorted"
    sorted = []

    until a.empty? || b.empty?
        # add the smallest first value of a or b to sorted array
        sorted << (a[0] <= b[0] ? a.shift : b.shift)
    end

    sorted + a + b
end

my_array = [2, 3 ,5, 8, 12, 1]
puts "Input Array: #{my_array}"             # => Input Array: [2, 3, 5, 8, 12, 1]
puts "Sorted Array: #{mergesort(my_array)}" # => Sorted Array: [1, 2, 3, 5, 8, 12]