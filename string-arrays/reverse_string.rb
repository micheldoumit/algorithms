require_relative '../helpers'

# 1.2 Reverse String

# mine take 1
def reverse(chars)
  result = StringIO.new

  for i in chars.length.downto(0)
    result << chars[i]
  end

  result.string.chars
end

assert(reverse('12345'.chars), '54321'.chars)

# mine take 2
def reverse_2(chars)
 # 12345 => 54321
 for i in 0..(chars.length)/2
   tmp = chars[i]
   swap_position = chars.length-1-i
   chars[i] = chars[swap_position]
   chars[swap_position] = tmp
 end

 chars
end

assert(reverse_2('12345'.chars), '54321'.chars)
# a complexidade seria o(n/2) ?

# book
# não entendi o codigo em c
