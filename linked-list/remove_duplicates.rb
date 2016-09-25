require_relative '../helpers.rb'
require_relative 'linked_item.rb'



def remove_duplicate(head)
  head
end


head = LinkedItem.from_array([1,2,3,4,5,6,4,8])
assert(remove_duplicate(head).to_array, [1,2,3,4,5,6,8])
