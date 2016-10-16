class StackNode
  attr_accessor :value, :previous

  def initialize(value, previous)
    self.value = value
    self.previous = previous
  end
end
