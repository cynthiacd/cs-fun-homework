require_relative 'Linked-List/linked_list.rb'

class Stack

  def initialize
    @store = LinkedList.new
  end

  def push(value)
    @store.insert(value)
  end

  def pop
    raise 'error - stack is empty' if self.empty? #
    top = self.top
    @store.delete(top)
    return top
  end

  def top
    return @store.find_nth_from_beginning(0)
  end

  def size
    return @insert_index
  end

  def empty?
    self.top ? false : true
  end
end

# stack = Stack.new
#
# ### testing push method
# stack.push(5)
# stack.push(6)
# stack.push(7)
#
# ### testing pop method
# 3.times { stack.pop } ## throws error cause stack is empty
# p stack
# # p stack.pop
# # p stack
#
# ### testing top method
# # p stack.top
#
# ### testing empty
# p stack.empty?
