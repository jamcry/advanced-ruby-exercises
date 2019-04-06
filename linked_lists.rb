class LinkedList
  attr_reader :head
  def initialize(value)
    @head = Node.new(value, nil)
  end
  
  # add a new node to the end of the list
  def append(value)
    # append a new node to the end ( next node of tail ) with specified value.
    tail.next_node = Node.new(value, nil)
  end
  
  # add a new node to the start of the list
  def preappend(value)
    # Replace the head with new node with specified value
    @head = Node.new(value, @head)
  end

  # return the total number of nodes in the list
  def size
    current_node = @head
    node_count = 0
    while !current_node.nil?
      node_count += 1
      current_node = current_node.next_node
    end
    node_count
  end

  # return the first node in the list
  def head
    #! this definition is unneccessary due to attr_reader
    @head
  end
  
  # return the last node in the list
  def tail
    self.each_with_index { |node, index| return node if index == (self.size - 1) }
  end
  
  # return the node at the given index
  def at(index)
    # return nil if index is out of range
    if index > (size - 1)
      nil
    else
      self.each_with_index { |n,i| return n.value if i == index }
    end
  end
  
  # remove the last element from the list
  def pop
    self.each do |node|
      if node.next_node.next_node.nil?
        last_value = node.next_node.value
        node.next_node.value = nil
        node.next_node = nil
        return last_value
      end
    end
    false
  end
  
  def contains?(data)
    # return if value is in the list
    self.each { |n| return true if n.value == data }
    false
  end
  
  # return the index of the node containing data or nil
  def find(data)
    self.each_with_index { |node, index| return index if node.value == data }
    nil
  end
  
  def to_s
    # Parse LinkedList to string # => ( data ) -> ( data ) -> ( data ) -> nil
    list_string = ""
    # Iterate until reaching the last (nil) node
    self.each { |n| list_string << "( #{n.value} ) -> " }
    list_string + "nil"
  end
  
  def each
    current_node = @head
    while !current_node.nil?
      # yield every node object
      yield(current_node)
      current_node = current_node.next_node
    end
  end

  def each_with_index
    current_node = @head
    node_index = 0
    while !current_node.nil?
      yield(current_node, node_index)
      current_node = current_node.next_node
      node_index += 1
    end
  end

end


class Node
  attr_accessor :value, :next_node
  
  def initialize(value, next_node)
    @value = value
    @next_node = next_node
  end
  
end

my_list = LinkedList.new(4)
my_list.append(5)
my_list.append(2)

puts my_list.to_s
puts "*Nodes     : #{my_list.size}"

puts "*Head Value: #{my_list.head.value}"
puts "*Tail Value: #{my_list.tail.value}"
puts "*at (1)    : #{my_list.at(1)}"
puts "*at (2)    : #{my_list.at(2)}"
puts "*at (3)    : #{my_list.at(3)}"
print "*each puts:"
my_list.each {|n| print " #{n.value}"}
puts ""
my_list.each_with_index {|n,i| puts "[#{i}] : ( #{n.value} )"}

puts "Contains 4: #{my_list.contains?(4)}"
puts "Contains 24: #{my_list.contains?(24)}"
puts "Find 4 : #{my_list.find(4)}"
puts "Find 7 : #{my_list.find(7)}"

puts "Preappend 452..."
my_list.preappend(452)
puts my_list.to_s

puts "Preappend 42..."
my_list.preappend(42)
puts my_list.to_s

puts "Pop..."
puts my_list.pop

puts my_list.to_s
puts my_list.size