require_relative '../linked-list/linked_list_node'

class Stack
  attr_accessor :top

  def push(value)
    node = LinkedListNode.new(value)
    if top == nil
      self.top = node
    else
      node.next_item = top
      self.top = node
    end

    true
  end

  def pop
    if self.top == nil
      return nil
    else
      value = self.top
      self.top = top.next_item
    end

    value.data
  end
end
