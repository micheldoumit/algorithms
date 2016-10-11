require_relative '../helpers.rb'

# mine
def remove_loop_node(head)
  n1 = head
  n2 = head

  while(n2.next_item != nil) do
    n1 = n1.next_item
    n2 = n2.next_item.next_item
    if (n1 == n2)      
      break
    end
  end

  retutn nil if (n2.next_item == nil)

  n1 = head
  while(n1 != n2) do
    n1 = n1.next_item
    n2 = n2.next_item
  end

  return n2.data
end

a = LinkedListNode.new("A")
b = LinkedListNode.new("B")
c = LinkedListNode.new("C")
d = LinkedListNode.new("D")
e = LinkedListNode.new("E")

a.next_item = b
b.next_item = c
c.next_item = d
d.next_item = e
e.next_item = c

puts remove_loop_node(a)
