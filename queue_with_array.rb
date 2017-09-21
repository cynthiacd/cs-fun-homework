require_relative 'Restricted-Array/restricted_array'

# works but can't tell if the queue is full or empty both last_index = front - 1
# can't figure out circular buffer - am I suppose to add one to the size
# do I need to add extra checks
# class Queue
#   attr_reader :front_index, :last_index, :size
#   SPECIAL_VALUE = 99999
#
#   def initialize(size=0)
#     @line = RestrictedArray.new(size)
#     @front_index = 1
#     @last_index = 0
#     @size = size
#   end
#
#   def enqueue(value)
#     # return @line[@front_index] = value if self.empty?
#     @last_index == @size - 1 ? @last_index = 0 : @last_index += 1
#     @line[@last_index] = value
#
#   end
#
#   def dequeue
#     first =  @line[@front_index]
#     @line[@front_index] = SPECIAL_VALUE
#     @front_index + 1 < @size ? @front_index += 1 : @front_index = 0
#     return first
#   end
#
#   def front
#     return @line[front_index]
#   end
#
#   def size
#   end
#
#   def empty?
#     p front_index
#     p last_index
#     front_index == last_index + 1 ? true : false
#   end
#
#   def full?
#     front_index == last_index + 1 ? true : false
#   end
# end
#
# queue = Queue.new(5)
#
# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# queue.enqueue(8)
# queue.enqueue(9)
# p queue
# # p queue.empty? # false
# # p queue.full? # true
#
# 5.times { queue.dequeue }
# p queue
#
# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# p queue
#
# queue.dequeue
# queue.dequeue
# p queue
#
# queue.enqueue(9)
# queue.enqueue(10)
# queue.enqueue(11)
# queue.enqueue(12)
# p queue

# works but can't tell if the queue is full or empty both last_index = front - 1
# can't figure out circular buffer - am I suppose to add one to the size
# do I need to add extra checks
class Queue
  attr_reader :front_index, :last_index, :size
  SPECIAL_VALUE = 99999

  def initialize(size=0)
    @line = RestrictedArray.new(size)
    @front_index = 0
    @last_index = 0
    @size = size + 1
  end

  def enqueue(value)
    if self.empty?
      @line[@last_index] = value
      # @last_index += 1
    else
      @line[@last_index] = value
    end
    @last_index == @size - 1 ? @last_index = 0 : @last_index += 1
  end

  def dequeue
    first =  @line[@front_index]
    @line[@front_index] = SPECIAL_VALUE
    @front_index + 1 < @size - 1 ? @front_index += 1 : @front_index = 0
    return first
  end

  def front
    return @line[front_index]
  end

  def size
  end

  def empty?
    # p front_index
    # p last_index
    front_index == last_index ? true : false
  end

  def full?
    front_index == last_index + 1 ? true : false
  end
end

queue = Queue.new(5)

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
queue.enqueue(8)
queue.enqueue(9)
p queue
# p queue.empty? # false
# p queue.full? # true

5.times { queue.dequeue }
p queue

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
p queue

queue.dequeue
queue.dequeue
p queue

queue.enqueue(9)
queue.enqueue(10)
queue.enqueue(11)
queue.enqueue(12)
p queue
