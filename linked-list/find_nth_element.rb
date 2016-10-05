require_relative '../helpers.rb'
require_relative 'linked_list_node.rb'

# mine
def find_nth_to_last_element(head, n)
  current = head
  size = 0
  while (current != nil)
    size +=1
    current = current.next_item
  end

  current = head
  nth_index = size - n - 1
  for i in 0..size-1
    break if i == nth_index
    current = current.next_item
  end

  current.data
end

assert(find_nth_to_last_element(list([1,2,3,4,5,6,7]), 3), 4)

# book

def find_nth_to_last_element_book(head, n)
  current = head
  current2 = head

  for i in 0..n do
    current = current.next_item
  end

  while (current != nil)
    current2 = current2.next_item
    current = current.next_item
  end

  current2.data
end

assert(find_nth_to_last_element_book(list([1,2,3,4,5,6,7]), 3), 4)
