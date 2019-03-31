def mergesort(array)
    len = array.length
    return array if len <= 1 # Base case
    
    # Divide array into smaller arrays and merge sort them
    a = mergesort(array[0...(len / 2)])
    
    b = mergesort(array[(len / 2)..])

    # Merge sub-arrays into new array "sorted"
    sorted = []
    until a.empty? || b.empty?
        sorted << (a[0] <= b[0] ? a.shift : b.shift)
    end

    sorted + a + b
end

my_a = [2, 3 ,5, 8, 12, 1]
p mergesort(my_a)