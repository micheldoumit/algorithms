require_relative '../helpers'
# nil <- <-> 2 <-> 3 <-> 4 <-> 5(top) -> nil
class StackLinked

  attr_accessor :top, :bottom, :length

  def initialize
    self.length = 0
  end

  def push(value)
    node = StackLinkedNode.new(value)
    self.bottom = node if length == 0
    node.below = top
    self.top.above = node if top
    self.top = node
    self.length += 1
    true
  end

  def pop
    return nil if top == nil
    node = self.top
    self.top = self.top.below
    self.length -= 1
    node.value
  end

  def remove_bottom
    node = self.bottom
    node.above.below = nil
    self.bottom = node.above
    self.length -= 1
    node
  end

end


class StackLinkedNode
  attr_accessor :above, :below, :value

  def initialize(value)
    self.value = value
  end
end


stack = StackLinked.new
stack.push("A")
stack.push("B")
stack.push("C")
assert(stack.pop, "C")
stack.remove_bottom
assert(stack.pop, "B")
assert(stack.pop, nil)
