a = [4, 3, 78, 2, 0, 2]

def bubble_sort(arr)
    bubble_sort_by(arr) {|a,b| a - b}
end

def bubble_sort_by(arr)
    sorted = false
    while !sorted
        sorted = true
        (1...arr.length).each do |i|
            if (yield(arr[i-1],arr[i]) > 0)
                arr[i-1], arr[i] = arr[i], arr[i-1]
                sorted = false
            end
        end
    end
end

bubble_sort(a)
puts a.inspect
words = ["hi", "hello", "hey", "a"]
bubble_sort_by(words) {|left,right| left.length - right.length}
puts words.inspect