require_relative '../helpers'

# mine
 def replace_spaces!(chars)
  i = 0
  size = chars.length-1
  while i < size do
     if chars[i] == ' '
       for o in size.downto(i) do
         chars[o + 2] = chars[o]
       end
       size += 2
       chars[i] = '%'
       chars[i + 1] = '2'
       chars[i + 2] = '0'
      end
    i += 1
  end
  chars
 end

assert(replace_spaces!('a a'.chars), 'a%20a'.chars)
assert(replace_spaces!('they dont know that we'.chars), 'they%20dont%20know%20that%20we'.chars)
assert(replace_spaces!('a a a a'.chars), 'a%20a%20a%20a'.chars)

# mine take 2 (insipired by the book)
def replace_spaces_2!(chars)
  spaces = 0
  for i in 0..chars.length-1
    spaces += 1 if chars[i] == ' '
  end

  index = (chars.length-1) + (spaces * 2)
  for i in (chars.length-1).downto(0) do

    if chars[i] == ' '
      chars[index] = '0'
      chars[index - 1] = '2'
      chars[index - 2] = '%'
      index -= 3
    else
      # move valor atual para o indice corrente
      # subtrai  1 no indice
      chars[index] = chars[i]
      index -= 1
    end
  end
  chars
end

assert(replace_spaces_2!('aa'.chars), 'aa'.chars)
assert(replace_spaces_2!('a a'.chars), 'a%20a'.chars)
assert(replace_spaces!('they dont know that we'.chars), 'they%20dont%20know%20that%20we'.chars)
