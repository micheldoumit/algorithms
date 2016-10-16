require_relative '../helpers'
require_relative 'stack_node'

class StackMin

  attr_accessor :min, :buffer

  def initialize
    self.buffer = []
  end

  def push(value)
    previous = min
    self.min  = value if min == nil || value < min
    self.buffer << StackNode.new(value, previous)
  end

  def pop
    node = self.buffer.delete_at(self.buffer.length-1)
    if self.min == node.value
      self.min = node.previous
    end

    node.value
  end

end


stacks = StackMin.new
stacks.push(5)
stacks.push(7)
stacks.push(8)
stacks.push(2)
stacks.push(9)
stacks.push(1)
assert(stacks.min, 1)
assert(stacks.pop, 1)
assert(stacks.min, 2)
assert(stacks.pop, 9)
assert(stacks.min, 2)
assert(stacks.pop, 2)
assert(stacks.min, 5)
