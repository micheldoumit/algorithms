require 'stringio'
require 'byebug'

######## HELPERS ########
$stdout.sync = true

def puts_green(text)
  print "\e[#{32}m#{text}\e[0m"
 end

def assert(actual, expected)
  raise "expected #{expected} but got #{actual} " if actual != expected
  puts_green "."
end

def print_array(array)
  separator = ''
  array.length.times { separator += "-"}
  array.each do |r|
    puts r.each { |p| p }.join(" ")
  end
  puts separator
end

def print_linked_list(head)
  string = []
  while(head.next_item != nil)
    string << head.data
    head = head.next_item
  end
  string << head.data #last

  puts string.join
end

######## HELPERS ########
