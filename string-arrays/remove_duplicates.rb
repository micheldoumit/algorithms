require_relative '../helpers'

# mine
def remove_duplicates(chars)
  map = Array.new(256)
  tail = 0

  for index in 0..chars.length-1 do
    char_code = chars[index].ord
    if(!map[char_code])
      chars[tail] = chars[index]
      tail = tail + 1
      map[char_code] = true
    end
  end

  chars[0..tail -1] # if it was c chars[tail] = 0
end

assert(remove_duplicates('aabcd3'.chars), 'abcd3'.chars)
assert(remove_duplicates('a'.chars), 'a'.chars)
assert(remove_duplicates(''.chars), ''.chars)
assert(remove_duplicates('aabcdddd3'.chars), 'abcd3'.chars)
assert(remove_duplicates('aaaabbbbebebebbbebebeb'.chars), 'abe'.chars)
