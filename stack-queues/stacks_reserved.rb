require_relative '../helpers'

# book
class StacksReserved

  attr_accessor :size, :buffer, :pointer

  def initialize
    self.size = 3;
    self.buffer = Array.new(size * 3);
    self.pointer = [0, 0, 0]
  end

  def push(num, value)
    index = self.size * num + pointer[num] + 1
    self.pointer[num] += 1
    self.buffer[index] = value
  end

  def pop(num)
    index = self.pointer[num] + (self.size  * num)
    value = buffer[index]
    self.buffer[index] = nil
    self.pointer[num] -= 1
    value
  end


end

stacks = StacksReserved.new
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
