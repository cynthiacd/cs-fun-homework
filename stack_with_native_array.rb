require_relative 'Restricted-Array/restricted_array'

class Stack
  attr_reader :insert_index, :top_index, :size

  def initialize(size)
    @store = RestrictedArray.new(size)
    @insert_index = 0
    @size = size
  end

  def push(value)
    return 'error - stack overflow' if !@store[insert_index]
    @store[insert_index] = value
    @insert_index += 1
  end

  # the last item in the array is the top of the stack
  def pop
    top = @store[insert_index - 1]
    # @store[top_index] = SPECIAL_VALUE # or just nil ## just need to move the index
    @insert_index -= 1
    return top
  end

  def top
    return @store[insert_index - 1]
  end

  def size
    return @insert_index
  end

  def empty?
    insert_index == 0 ? true : false
  end

  def full?
  end

end


# stack = Stack.new(10)
# # p stack.empty? # true
# # p stack
#
# ## testing push
# stack.push(1)
# stack.push(7)
# stack.push(-2)
# p stack
#
# ## testing pop
# stack.pop
# stack.pop
# stack.pop
# # p stack
#
# ## push some more on
# stack.push(5)
# stack.push(23)
# stack.push(8)
# p stack
#
# # p stack.size
#
# ### Testing empty?
# # p stack.empty? # false
# # stack2 = Stack.new(5)
# # p stack2.empty? # true
#
#
# ### what happens if you don't have needed size
# stack.push(4)
# stack.push(9)
# stack.push(100)
# stack.push(43)
# stack.push(32) # doesn't error but dosen't work # added guard check
