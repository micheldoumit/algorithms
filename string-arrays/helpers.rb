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
######## HELPERS ########
