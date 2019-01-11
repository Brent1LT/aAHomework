class Stack
  attr_reader :stack
  def initialize
    @stack = []
  end

  def push(el)
    stack << el
  end

  def pop
    el = stack[-1]
    stack = stack[0...-1]
    el
  end

  def peek
    stack[-1]
  end
end
