module Enumerable

def my_each
    (0...self.length).each do |i|
        current_element = self[i]
        yield(current_element)
    end
    self
end

def my_each_with_index
    (0...self.length).each do |i|
        current_element = self[i]
        yield(current_element, i)
    end
end

def my_select
    selected_array = []
    self.my_each do |e|
        selected_array << e if yield(e)
    end
    selected_array
end

def my_all?
    # Returns true if all elements match with the given block conditions
    self.my_each do |e|
        return false if !yield(e)
    end
    return true
end

def my_any?
    # Returns true if there is at least one match for given block
    self.my_each do |e|
        return true if yield(e)
    end
    return false
end

def my_none?
    # Returns true if there is no match for given block
    !my_any?(&Proc.new) # if not any match, it is none
end

def my_count
    # Returns the length of selected array
    self.my_select(&Proc.new).length # pass yield block to my_select fn. using a new proc
end

def my_map(proc = nil)
    # Returns a new array created by applying mapping block to given array
    mapped_array = []
    self.my_each do |e|
        block_result = proc ? (proc.call e) : (yield e)
        mapped_array << e if block_result
    end
    mapped_array
end

def my_inject(memo = nil)
    unless memo
        memo = self[0]
        start_index = 1
    else
        start_index = 0
    end
    (start_index...self.length).each do |i|
        memo = yield(memo, self[i])
    end
    memo
end

def multiply_els
    self.my_inject {|m,v| m * v}
end

end