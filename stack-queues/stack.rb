require_relative '../linked-list/linked_list_node'

class Stack
  attr_accessor :top, :length

  def initialize
    self.length = 0
  end

  def push(value)
    node = LinkedListNode.new(value)
    if top == nil
      self.top = node
    else
      node.next_item = top
      self.top = node
    end

    self.length += 1
    true
  end

  def pop
    if self.top == nil
      return nil
    else
      value = self.top
      self.top = top.next_item
    end

    self.length -= 1
    value.data
  end
end
