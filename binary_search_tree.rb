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
      end
    end
  end


  def breadth_first_search(target)
    # create an array that acts like a queue
    queue = [self]

    # search until there are no nodes left
    until queue.length == 0
        # pop the first element and assign to the node variable
        node = queue.shift
        
        # return the current node if the target value found
        return node if node.value == target
        
        # add the children of the current node to the queue if any
        queue << node.left if !node.left.nil?
        queue << node.right if !node.right.nil?
    end
    nil
  end


  # Depth-First Search (Preorder) implementation
  def depth_first_search(target)
    # create an array that acts like a stack
    stack = [self]
    # visited array keeps the visited nodes
    visited = []
    
    # search until there are no nodes left
    until stack.length == 0
      # get the last element in the stack
      node = stack[-1]

      # mark current node as visited
      visited << node

      # return the current node if the target value found
      return node if node.value == target
      
      # if there is unvisited left node, add it to stack
      if node.left && !visited.include?(node.left)
        stack << node.left
      # else if there is unvisited right node, add it to stack
      elsif node.right && !visited.include?(node.right)
        stack << node.right
      # if there are no visited children, pop the node from stack
      else
        stack.pop
      end
    end
    nil
  end


  def dfs_rec(target, node = self)
    left_dfs = node.left.dfs_rec(target) if node.left
    return left_dfs if left_dfs
    
    right_dfs = node.right.dfs_rec(target) if node.right
    return right_dfs if right_dfs
    
    return node if node.value == target
    return nil
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

puts "Input Array: [8,3,10,1,6,14,4,7,13]".center(45,"="), ""
puts "Binary Search Tree".upcase.center(45,"-")
puts "     #{wiki.value}"
puts "   /   \\"
puts "  #{wiki.left.value}    #{wiki.right.value}"
puts " / \\    \\"
puts "#{wiki.left.left.value}   #{wiki.left.right.value}   #{wiki.right.right.value}"
puts "   /  \\   \\"
puts "  #{wiki.left.right.left.value}    #{wiki.left.right.right.value}   #{wiki.right.right.left.value}"
# Needs a better way to print the tree.
puts "","Testing Search Algorithms".center(45,"-")
puts "> Breadth-First Search (3): #{wiki.breadth_first_search(3)}"
puts "> Breadth-First Search (13): #{wiki.breadth_first_search(13)}"
puts "> Breadth-First Search (45): #{wiki.breadth_first_search(45)}"
puts "> Depth-First Search (3): #{wiki.depth_first_search(3)}"
puts "> Depth-First Search (13): #{wiki.depth_first_search(13)}"
puts "> Depth-First Search (45): #{wiki.depth_first_search(45)}"
puts "> Depth-First Search (3): #{wiki.dfs_rec(3)}"
puts "> Depth-First Search (13): #{wiki.dfs_rec(13)}"
puts "> Depth-First Search (45): #{wiki.dfs_rec(45)}"
