# 0: 1, 2, 3, 4, 5
# 1: 6, 7, 8, 9, 10
require_relative 'stack'
require_relative '../helpers'

# mine
class SetOfStacks
  attr_accessor :stacks, :limit

  def initialize(limit)
    self.limit = limit
    self.stacks = []
  end

  def push(value)
    stack = nil
    if self.stacks.length == 0
      stack = Stack.new
      self.stacks << stack
    else
      self.stacks.each do |stack_item|
        if stack_item.length < self.limit
          stack = stack_item
          break
        end
      end
      if stack == nil
        stack = Stack.new
        self.stacks << stack
      end
    end

    stack.push(value)
  end

  def pop
    for i in (stacks.length-1).downto(0)
      return stacks[i].pop if stacks[i].length > 0
    end
  end

end

set_of_stacks = SetOfStacks.new(3)
5.times { |i| set_of_stacks.push(i) }
assert(set_of_stacks.pop, 4)
assert(set_of_stacks.pop, 3)
assert(set_of_stacks.pop, 2)
assert(set_of_stacks.pop, 1)
assert(set_of_stacks.pop, 0)
set_of_stacks.push(6)
set_of_stacks.push(7)
set_of_stacks.push(8)
set_of_stacks.push(9)
assert(set_of_stacks.pop, 9)
assert(set_of_stacks.pop, 8)
assert(set_of_stacks.pop, 7)
assert(set_of_stacks.pop, 6)
