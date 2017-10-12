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

  def search_recursive(root, value)
    @root = root
    node = @root

    if !node
      return false
    elsif node.value == value
      return true
    elsif value < node.value
      search_recursive(node.left, value)
    else
      search_recursive(node.right, value)
    end
  end

  # this builds the tree
  def insert(value)
    return @root = TreeNode.new(value) if !@root
    find_insert_position(@root, value)
  end

  # didn't know you could set default as root -
  # time complexity is O(n)
  # space complexity is O(log n)
  def find_height
    return height(@root)
  end

  def height(node)
    return 0 if !node
    # find height of left side and save
    height_left = height(node.left)
    # find heigh of right side and save
    height_right = height(node.right)
    # compare left and right return greater side + 1
    if height_left < height_right
      return height_right + 1
    else
      return height_left + 1
    end
  end
  # another way to declare private methods put this below the private method
  private :height

  ## does this still keep the root private? yes but not as clear
  # def height(node=@root)
  #   return 0 if !node
  #   # find height of left side and save
  #   height_left = height(node.left)
  #   # find heigh of right side and save
  #   height_right = height(node.right)
  #   # compare left and right return greater side + 1
  #   if height_left < height_right
  #     return height_right + 1
  #   else
  #     return height_left + 1
  #   end
  # end

  ## only need with recursive
  def delete(value)
  end

  ## optional
  # def find_max()
  # end
  #
  # def find_min()
  # end

  # time complexity O(n)
  # space complexity O(log n)
  def print_in_order()
    in_order(@root)
  end

  def print_post_order
    post_order(@root)
  end

  def print_pre_order
    pre_order(@root)
  end

  def print_level_order # bredth first traversal
    height = self.find_height

    height.times do |i|
      print_given_level(@root, i + 1)
    end

    return
  end

  private

  # recursive helper method for insert
  def find_insert_position(current, value)
    if value < current.value
      if current.left
        return find_insert_position(current.left, value)
      else
        current.left = TreeNode.new(value)
        return
      end
    else
      if current.right
        return find_insert_position(current.right, value)
      else
        current.right = TreeNode.new(value)
        return
      end
    end
  end

  def in_order(node)
    return if node == nil
    in_order(node.left)
    print node.value.to_s + " "
    in_order(node.right)
  end

  def post_order(node)
    return if node == nil
    post_order(node.left)
    post_order(node.right)
    print node.value.to_s + " "
  end

  def pre_order(node)
    return if node == nil
    print node.value.to_s + " "
    pre_order(node.left)
    pre_order(node.right)
  end

  # O(n * height of tree)
  # average O(nlog n)
  # worst case O (n^2) when tree is skewed
  # space: expected O(log n) worse case O(n)
  def print_given_level(node, level)
    return if !node
    if level == 1
      print node.value.to_s + " "
    else
      print_given_level(node.left, level -1)
      print_given_level(node.right, level -1)
    end
  end
end


# initialize a tree
tree = BinaryTree.new
# build out a tree
tree.insert(5)
tree.insert(2)
tree.insert(11)
tree.insert(-4)
tree.insert(4)
tree.insert(8)
tree.insert(19)
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
p "tree in level order: "
p tree.print_level_order


#### testing search recursive
# p tree.search_recursive(root, 4) #true
# p tree.search_recursive(root, 22) #false

#### testing height of tree
p tree.find_height.to_s # should equal 3
