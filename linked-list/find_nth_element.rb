require_relative '../helpers.rb'
require_relative 'linked_list_node.rb'

# mine
def find_nth_to_last_element(head, index)
  current = head
  size = 0
  while (current != nil)
    size +=1
    current = current.next_item
  end

  current = head
  nth_index = size - index
  for i in 0..size-1
    break if i == nth_index
    current = current.next_item
  end

  current.data
end

assert(find_nth_to_last_element(list([1,2,3,4,5,6,7]), 3), 5)
