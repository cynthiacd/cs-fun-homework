require_relative 'stack_with_linked_list'
require_relative 'queue_with_linked_list'

class BinaryTree

  def initialize
    @root = nil
  end

  # this should be part of Tree - TreeNodes outside the binaryTree class doesn't make sense
  # this is not a truly private class - with Ruby you can still access outside BinaryTree example BinaryTree::TreeNode.new
  # good OOD, this should be private - research how to make Ruby
  class TreeNode
     attr_accessor :value, :left, :right

     def initialize(val, left=nil, right=nil)
       @value = val
       @left = left
       @right = right
     end
  end

  # Time complexity: O(log n)
  # Space complexity: O(1)
  def insert(value)
    # create a node to insert
    node = TreeNode.new(value)

    # check root - if empty node becomes root
    return @root = node if !@root

    # set current at root
    current = @root
    parent = nil

    while current != nil
      parent = current
      if value <= current.value
        current = current.left
      else
        current = current.right
      end
    end

    if value < parent.value
      parent.left = node
    else
      parent.right = node
    end
  end

  # time complexity: O(log n) - base 2
  # space complexity:
  def search(value)
    node = @root # node could be named current_node

    while node
      return true if node.value == value
      value < node.value ? node = node.left : node = node.right
    end

    return false
  end

  # Time complexity: O(n) since you visit each node
  def height
    return 0 if !@root

    queue = Queue.new
    queue.enqueue(@root)
    height = 0

    until queue.empty?
      size = queue.size

      until size == 0
        current = queue.dequeue

        if current.left
          queue.enqueue(current.left)
        end

        if current.right
          queue.enqueue(current.right)
        end

        size -= 1
      end

      height += 1
    end

    return height
  end

  # root left right
  # Time complexity: O(n) print each element
  # Space complexity: O(log n) using an auxillary stack data
  def print_pre_order
    stack = Stack.new # yikes how do you decided on your size  -- used Stack with a Linked List
    # p @root
    stack.push(@root)

    until stack.empty? == true
      current_node = stack.pop
      print current_node.value.to_s + " "
      stack.push(current_node.right) if current_node.right != nil
      stack.push(current_node.left) if current_node.left != nil
    end

    return
  end

  def print_in_order
    return if !@root

    stack = Stack.new
    current = @root

    while current || stack.empty? == false
      if current
        stack.push(current)
        current = current.left
      elsif stack.empty? == false
        current = stack.pop
        print current.value.to_s + " "
        current = current.right
      end
    end
  end

  def print_post_order
    stack1 = Stack.new
    stack2 = Stack.new

    stack1.push(@root)

    while stack1.empty? == false
      current = stack1.pop

      stack2.push(current)
      stack1.push(current.left) if current.left != nil
      stack1.push(current.right) if current.right != nil
    end

    while stack2.empty? == false
      print stack2.pop.value.to_s + ' '
    end
  end

  def print_level_order # bredth first traversal
  end
end




# initialize a tree
tree = BinaryTree.new
# build out a tree
tree.insert(5)
tree.insert(2)
tree.insert(11)
# tree.insert(-4)
# tree.insert(4)
# tree.insert(8)
# tree.insert(19)
# tree.insert(9) # this should start 4th level in tree
# tree.insert(-6)
# tree.insert(12)
# tree.insert(21)

# see if that worked :)
# p tree # should get a BinaryTree Obj that contains Node Objects

##### testing search method #####
# p tree.search(4) #true
# p tree.search(11) #true
# p tree.search(5) #true
# #
# p tree.search(22) #false
# p tree.search(-5) #false

##### Testing print methods
# p "tree in order:"
# p tree.print_in_order
# p "tree in post order:"
# p tree.print_post_order
# p "tree in pre order:"
# p tree.print_pre_order
# p "tree in order: "
# p tree.print_in_order
#
# p "tree in post order"
# p tree.print_post_order

p 'tree height is: '
p tree.height

#### Testing Search Iterative
# p tree.search(8) # true
# p tree.search(100) # false

#### Testing Height of tree
# p tree.find_height.to_s # should equal 3
