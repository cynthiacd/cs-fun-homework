require_relative 'Linked-List/linked_list'

class Queue
  attr_reader :size

  def initialize
    @line = LinkedList.new
    @size = 0
  end

  def enqueue(value)
    @line.insert(value)
    @size += 1
  end

  def dequeue
    front_value = self.front
    @line.delete(front_value)
    @size -= 1
    return front_value
  end

  def front
    return @line.find_nth_from_beginning(@size - 1)
  end

  def size
    return @size
  end

  def empty?
    @size == 0 ? true : false
  end
end

queue = Queue.new

# testing enqueue
queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
queue.enqueue(8)
queue.enqueue(9)
# p queue

# testing dequeue
queue.dequeue # should return 5
queue.dequeue # should return 6

p 'testing size - should be 3: '
p queue.size # should return 3

#testing front
p 'testing front - should be 7 '
p queue.front # should be 7

# testing empty?
p 'testing empty? should be false'
p queue.empty? # should be false
3.times { queue.dequeue }
p 'testing empty? again - should be true'
p queue.empty? # should be true
