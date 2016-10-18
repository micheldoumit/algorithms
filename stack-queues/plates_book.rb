# 0: 1, 2, 3, 4, 5
# 1: 6, 7, 8, 9, 10
require_relative 'stack_linked'
require_relative '../helpers'

# mine
class SetOfStacksBook
  attr_accessor :stacks, :limit

  def initialize(limit)
    self.limit = limit
    self.stacks = []
  end

  def push(value)
    stack = nil
    if self.stacks.length == 0
      stack = StackLinked.new
      self.stacks << stack
    else
      self.stacks.each do |stack_item|
        if stack_item.length < self.limit
          stack = stack_item
          break
        end
      end
      if stack == nil
        stack = StackLinked.new
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
        last = self.stacks[i].remove_bottom.value
        self.stacks[i-1].push(last)
      end
    end

    result
  end

end

# popt_at
set_of_stacks = SetOfStacksBook.new(3)
11.times { |i| set_of_stacks.push(i) }
assert(set_of_stacks.pop_at(0), 2)
assert(set_of_stacks.stacks[0].length, 3)
assert(set_of_stacks.stacks[1].length, 3)
assert(set_of_stacks.stacks[2].length, 3)
assert(set_of_stacks.stacks[3].length, 1)
