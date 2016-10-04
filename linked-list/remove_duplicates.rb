require_relative '../helpers.rb'
require_relative 'linked_list_node.rb'

# mine take 1
# using an array
def remove_duplicate(head)
  existing = [head.data]
  current = head
  while current.next_item != nil do
    if existing.include?(current.next_item.data)
      if current.next_item.next_item
        current.next_item = current.next_item.next_item
      else
        current.next_item = nil
        break
      end
    else
      existing << current.data
    end

    current = current.next_item
  end

  head
end

assert(remove_duplicate(list([1,2,3,4,5,6,4,8])).to_array, [1,2,3,4,5,6,8])
assert(remove_duplicate(list([1,2,3,4,5,6,7,4])).to_array, [1,2,3,4,5,6,7])

# mine take 2 (in place)
# We sort and jump equals

def remove_duplicate_in_place(head)
  head = LinkedListNode.from_array(head.to_array.sort)
  current = head
  while (current.next_item != nil) do
    if current.next_item.data != current.data
      current = current.next_item
    else
      current.next_item = find_different_next(current)
    end
  end

  head
end

def find_different_next(head)
  current = head
  while (current.next_item.data == current.data)
    current = current.next_item
  end

  current.next_item
end

assert(remove_duplicate_in_place(list([1,2,3,3,4,5,6,4,8,1])).to_array, [1,2,3,4,5,6,8])

# mine inspired by the book
# we have 2 pointers, one with normal iteration and one to previons nodes

def remove_duplicate_inspired_book(head)
  current = head
  previous = nil
  keep_previous = false
  while current != nil do
    runner = head
    while runner != current
      if runner.data == current.data
        previous.next_item = current.next_item
        keep_previous = true
        break
      else
        runner = runner.next_item
        keep_previous = false
      end
    end
    previous = current unless keep_previous
    current = current.next_item
  end

  head
end

assert(remove_duplicate_inspired_book(list([1,2,3,3,3,3,4,2,5])).to_array, [1,2,3,4,5])


# book
def remove_duplicate_in_place_book(head)
  previous = head
  current = previous.next_item
  while current != nil do
    runner = head
    while runner != current do
      if runner.data == current.data
        previous.next_item = current.next_item
        current = current.next_item
        break;
      end
      runner = runner.next_item
    end
    if runner == current
      previous = current
      current = current.next_item
    end
  end

  head
end

assert(remove_duplicate_in_place_book(list([1,2,3,3,3,3,4,2,5])).to_array, [1,2,3,4,5])
assert(remove_duplicate_in_place_book(list([1,2,3,4,2,5])).to_array, [1,2,3,4,5])
