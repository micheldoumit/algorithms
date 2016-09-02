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

######## HELPERS ########
