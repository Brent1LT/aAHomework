class Queue
  attr_reader :queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    queue = el + queue
  end

  def dequeue
    queue = queue[0...-1]
  end

  def peek
    queue[-1]
  end
end
