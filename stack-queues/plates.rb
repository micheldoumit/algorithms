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

  def pop_at(index)
    stack = self.stacks.at(index)
    result = stack.pop

    if index < self.stacks.length-1
      for i in (self.stacks.length-1).downto(index+1)
        last = pop_last(self.stacks[i])
        self.stacks[i-1].push(last)
      end
    end

    result
  end

  def pop_last(stack)
    tmp = []
    while stack.length > 1
      tmp << stack.pop
    end
    last = stack.pop
    tmp.each { |t| stack.push(t)}
    last
  end

end

set_of_stacks = SetOfStacks.new(3)
5.times { |i| set_of_stacks.push(i) }
assert(set_of_stacks.pop, 4)
assert(set_of_stacks.pop, 3)
assert(set_of_stacks.pop, 2)
assert(set_of_stacks.pop, 1)
assert(set_of_stacks.pop, 0)

# popt_at
11.times { |i| set_of_stacks.push(i) }
assert(set_of_stacks.pop_at(0), 2)
assert(set_of_stacks.stacks[0].length, 3)
assert(set_of_stacks.stacks[1].length, 3)
assert(set_of_stacks.stacks[2].length, 3)
assert(set_of_stacks.stacks[3].length, 1)
