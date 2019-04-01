class LinkedList
  attr_reader :head
  def initialize(value)
    @head = Node.new(value, nil)
  end

  def append(value)
    # Add a new node to the end of the list
    # Append a new node to the end ( next node of tail) with specified value.
    tail.next_node = Node.new(value, nil)
  end

  def preappend
    # adda a new node to the start of the list
  end

  def size
    # return the total number of nodes in the list
    current_node = @head
    node_count = 0
    while !current_node.nil?
      node_count += 1
      current_node = current_node.next_node
    end
    node_count
	end

	def head
    # return the first node in the list
    #! this definition is unneccessary due to attr_reader
    @head
	end

	def tail
    # return the last node in the list
    current_node = @head
    while !current_node.next_node.nil?
      current_node = current_node.next_node
    end
    current_node
	end

	def at(index)
    # return the node at the given index
    current_node = @head
    # return nil if index is out of range
    if index > (size - 1)
      nil
    else
      index_count = 0
      (0...index).each do |i|
        current_node = current_node.next_node
      end
      current_node.value
    end
	end

	def pop
		# remove the last element from the list
	end

	def contains?(value)
		# return if value is in the list
	end

	def find(data)
    # return the index of the node containing data or nil
    #? can use (yield) in tail, inside while loop to use it
    #? in find function.
    #? tail {|val| val = data} break
	end

	def to_s
    # Parse LinkedList to string # => ( data ) -> ( data ) -> ( data ) -> nil
    current_node = @head
    parsed_list = ""
    # Iterate until reaching the last (nil) node
    until current_node.nil?
      parsed_list += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    parsed_list + "nil"
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