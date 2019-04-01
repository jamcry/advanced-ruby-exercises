class LinkedList
	def initialize
	end

	def append
		# Add a new node to the end of the list
	end

	def preappend
		# adda a new node to the start of the list
	end

	def size
		# return the total number of nodes in the list
	end

	def head
		# return the first node in the list
	end

	def tail
		# return the last node in the list
	end

	def at(index)
		# return the node at the given index
	end

	def pop
		# remove the last element from the list
	end

	def contains?(value)
		# return if value is in the list
	end

	def find(data)
		# return the index of the node containing data or nil
	end

	def to_s
		# Parse LinkedList to string # => ( data ) -> ( data ) -> ( data ) -> nil
	end
	
	end
end

class Node
	attr_accessor :value, :next_node
	
	def initialize(value, next_node)
		@value = nil
		@next_node = nil
	end
end