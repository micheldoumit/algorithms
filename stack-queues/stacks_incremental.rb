require_relative '../helpers'

# book
class StacksIncremental

  attr_accessor :size, :buffer, :pointer, :used

  def initialize
    self.size = 3;
    self.buffer = Array.new(size * 3);
    self.pointer = [-1, -1, -1]
    self.used = 0
  end

  def push(num, value)
    last_index = self.pointer[num]
    self.pointer[num] = self.used
    node = StackNode.new(value, last_index)
    self.buffer[used] = node
    self.used += 1
  end

  def pop(num)
    node = buffer[self.pointer[num]]
    return nil if node == nil
    buffer[self.pointer[num]] = nil
    self.pointer[num] = node.previous
    self.used -=1

    node.value
  end
end


class StackNode
  attr_accessor :value, :previous

  def initialize(value, previous)
    self.value = value
    self.previous = previous
  end
end

stacks = StacksIncremental.new
stacks.push(0,"A1")
stacks.push(0,"A2")
stacks.push(0,"A3")
assert(stacks.pop(0),"A3")
stacks.push(1,"B1")
stacks.push(1,"B2")
assert(stacks.pop(0),"A2")
assert(stacks.pop(1),"B2")
assert(stacks.pop(1),"B1")
assert(stacks.pop(1), nil)
