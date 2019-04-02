class Node
  attr_accessor :value, :parent, :children
  
  def initialize(value = nil, parent = nil, children = {})
    @value = value
    @parent = parent
    @children = children
  end

  def build_tree(array)
    root_node = self
    
    array.each_with_index do |n, i|
      # Start from the root node for each array element
      node = root_node
    
      if i == 0
        node.value = n
    
      else
        # Find where will the new node will be added
        pointer = (n < node.value) ? :left : :right
        #?! The repetition of pointer selection can be
        #?! prevented by using #parent.value for decision.

        # Go down to the last node in the branch
        until node.children[pointer].nil?
          node = node.children[pointer]
          # Decide pointer for the new node according to parent
          pointer = (n < node.value) ? :left : :right
        end

        node.children[pointer] = Node.new(n, node)
        
        # puts "Created new node with value:#{node.children[pointer].value}"
      end

    end
  end

  def left
    self.children[:left]
  end

  def right
    self.children[:right]
  end
end

wiki = Node.new()
wiki.build_tree([8,3,10,1,6,14,4,7,13])

puts "Input Array: [8,3,10,1,6,14,4,7,13]".center(45,"=")
puts "Binary Search Tree".upcase.center(45,"-")
puts "     #{wiki.value}"
puts "   /   \\"
puts "  #{wiki.left.value}    #{wiki.right.value}"
puts " / \\     \\"
puts "#{wiki.left.left.value}    #{wiki.left.right.value}   #{wiki.right.right.value}"
puts "   / \\     \\"
puts "  #{wiki.left.right.left.value}    #{wiki.left.right.right.value}   #{wiki.right.right.left.value}"
# Needs a better way to print the tree.
