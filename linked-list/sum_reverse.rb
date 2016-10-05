require_relative '../helpers.rb'
require_relative 'linked_list_node.rb'

# mine
def sum_reverse(head1, head2)
  current1 = head1
  current2 = head2
  sum = 0
  result_head = nil
  next_item_sum = 0
  while (current1 != nil) do
    sum = current1.data + current2.data + next_item_sum
    if(sum < 10)
      value = sum
      next_item_sum = 0
    else
      value = sum % 10
      next_item_sum = 1
    end

    if(result_head == nil)
      result_head = LinkedListNode.new(value)
    else
      tmp = result_head
      result_head = LinkedListNode.new(value)
      result_head.next_item = tmp
    end

    current1 = current1.next_item
    current2 = current2.next_item
  end

  result_head
end

print_linked_list(sum_reverse(list([3,1,5]), list([5,9,3])))

#assert(sum_reverse(list([3,1,5]), list([5,9,2])).to_array, [8,0,8])
