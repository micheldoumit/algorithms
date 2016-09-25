require_relative '../helpers.rb'
require_relative 'linked_item.rb'

# mine take 1
def remove_duplicate(head)
  existing = [head.data]
  current = head
  while current.next_item != nil
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

def remove_duplicate_in_place(head)
  head = LinkedItem.from_array(head.to_array.sort)
  current = head
  while (current.next_item != nil)
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

assert(remove_duplicate_in_place(list([1,2,3,4,5,6,4,8])).to_array, [1,2,3,4,5,6,8])
