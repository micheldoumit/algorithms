require_relative '../helpers.rb'

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

assert(sum_reverse(list([3,1,5]), list([5,9,2])).to_array, [8,0,8])

# book (inspired)
def sum_reverse_book(l1, l2, carry = 0)
  return nil if l1 == nil && l2 == nil

  value = carry
  value += l1.data if l1
  value += l2.data if l2
  node_value = value % 10
  next_carry = value >= 10 ? 1 : 0
  result = LinkedListNode.new(node_value)

  next_l1 = l1 == nil ? nil : l1.next_item
  next_l2 = l2 == nil ? nil : l2.next_item

  result.next_item = sum_reverse_book(next_l1, next_l2, next_carry)

  result
end

assert(sum_reverse_book(list([3,1,5]), list([5,9,2])).to_array, [8,0,8])
