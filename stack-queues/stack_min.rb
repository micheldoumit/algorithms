require_relative '../helpers'
require_relative 'stack_node'

# mine
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

# book optimized
class StackMin2

  attr_accessor :buffer, :mins

  def initialize
    self.buffer = []
    self.mins = []
  end

  def push(value)
    min_changed = self.min == nil || value < self.min
    self.mins << value if min_changed
    self.buffer << value
  end

  def pop
    value = self.buffer.delete_at(self.buffer.length-1)
    if self.min == value
      self.mins.delete_at(self.mins.length-1)
    end

    value
  end

  def min
    self.mins.last
  end
end

stacks = StackMin2.new
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
