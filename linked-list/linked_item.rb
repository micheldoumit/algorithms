class LinkedItem
  attr_accessor :data, :next_item

  def initialize(data)
    self.data = data
  end

  def self.from_array(array)
    head = LinkedItem.new(array.delete_at(0))
    array.each do |a|
      head.append(LinkedItem.new(a))
    end
    head
  end

  def to_array
    head = self
    result = [data]
    while (head.next_item != nil)
      result << head.next_item.data
      head = head.next_item
    end
    result
  end

  def tail
    item = self
    while(item.next_item!=nil)
      item = item.next_item
    end

    item
  end

  def append(item)
    tail.next_item = item
  end
end
