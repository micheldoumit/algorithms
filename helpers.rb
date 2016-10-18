require 'stringio'
require 'byebug'
require_relative 'linked-list/linked_list_node.rb'

######## HELPERS ########
$stdout.sync = true

def puts_green(text)
  print "\e[#{32}m#{text}\e[0m"
 end

def assert(actual, expected)
  raise "expected #{expected} but got #{actual} " if actual != expected
  puts_green "."
end

def print_bidimensional_array(array)
  separator = ''
  array.length.times { separator += "-"}
  array.each do |r|
    puts r.each { |p| p }.join(" ")
  end
  puts separator
end

def print_array(array)
  puts "[#{array.join(',')}]"
end

def list(array)
  LinkedListNode.from_array(array)
end

def print_linked_list(head)
  return nil if head == nil
  string = []
  while(head.next_item != nil)
    string << head.data
    head = head.next_item
  end
  string << head.data

  puts string.join('->')
end

def print_linked_stack(stack)
  string = []
  while(stack.length > 0)
    puts "#{stack.length}"
    string << stack.pop
  end

  puts string.join('->')
end

######## HELPERS ########
