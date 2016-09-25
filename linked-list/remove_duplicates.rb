require_relative '../helpers.rb'
require_relative 'linked_item.rb'

# first simple
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
