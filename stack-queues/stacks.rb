require_relative '../helpers'

# mine
class Stacks
  attr_accessor :index1
  attr_accessor :index2
  attr_accessor :index3
  attr_accessor :array

  def initialize
    self.array = []
  end

  def push(stack_num, value)
    index = index_map(stack_num)
    if array.length == 0
      index = 0
      array[index] = value
    elsif index == nil
      index = array.length
      array[index] = value
    else
      for i in array.length.downto(index + 1) do
        array[i] = array[i -1]
      end
      array[index] = value
    end
    set_index(stack_num, index)
    true
  end

  def peek(stack_num)
    index = index_map(stack_num)
    array[index]
  end

  def pop(stack_num)
    index = index_map(stack_num)
    return nil if index == nil

    value = array[index]
    tail = tail(index)
    for i in index..tail(index)-1 do
      array[i] = array[i+1]
    end
    array.delete_at(tail)
    set_index(stack_num, nil) if index == tail

    index_minus_one(index)

    value
  end

  def set_index(num, value)
    case num
      when 1
        self.index1 = value
      when 2
         self.index2 = value
      when 3
        self.index3 = value
      else
        raise "num < 3"
    end
  end

  def index_map(num)
    case num
      when 1
        self.index1
      when 2
         self.index2
      when 3
        self.index3
      else
        raise "num < 3"
    end
  end

  def tail(index)
    value = bigger_index(index).sort.first
    value != nil ? value-1 : self.array.length-1
  end

  def bigger_index(index)
    existing = []
    existing << self.index1 if self.index1 != nil
    existing << self.index2 if self.index2 != nil
    existing << self.index3 if self.index3 != nil
    existing.select { |i| i > index }
  end

  def index_minus_one(index)
    self.index1 -= 1 if self.index1 != nil && self.index1 > index
    self.index2 -= 1 if self.index2 != nil && self.index2 > index
    self.index3 -= 1 if self.index3 != nil && self.index3 > index
  end
end
