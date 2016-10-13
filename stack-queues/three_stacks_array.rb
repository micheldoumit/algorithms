require_relative '../helpers'
require_relative 'stacks'

stacks = Stacks.new
stacks.push(1,"1A")
stacks.push(1,"1B")
stacks.push(1,"1C")
stacks.push(2,"2A")
stacks.push(2,"2B")
stacks.push(2,"2C")
stacks.push(3,"3A")
stacks.push(3,"3B")
stacks.push(3,"3C")

assert(stacks.pop(1), "1C")
assert(stacks.pop(1), "1B")
assert(stacks.pop(1), "1A")
assert(stacks.pop(1), nil)
assert(stacks.pop(1), nil)
assert(stacks.pop(2), "2C")
assert(stacks.pop(3), "3C")
assert(stacks.pop(3), "3B")
assert(stacks.pop(3), "3A")
assert(stacks.pop(3), nil)
assert(stacks.pop(2), "2B")
assert(stacks.pop(2), "2A")
assert(stacks.pop(2), nil)
assert(stacks.pop(3), nil)

stacks.push(1,"1A")
stacks.push(1,"1B")
stacks.push(2,"2A")
stacks.push(2,"2B")
stacks.push(3,"3A")
stacks.push(3,"3B")

assert(stacks.pop(1), "1B")
assert(stacks.pop(1), "1A")
