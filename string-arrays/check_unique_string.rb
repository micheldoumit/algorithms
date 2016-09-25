require_relative 'helpers.rb'

# 1.1 Check that all characters are unique on a string

# mine
# questions: is it O(n) ?
def all_characters_uniq?(string)
  characters = string.chars #['a', 'b', 'c', 'a']
  return true if characters.length == 0

  comparsion = [characters.pop]

  for i in 0..characters.length
    if comparsion.include?(characters[i])
      return false
    end
  end

  return true
end

assert all_characters_uniq?("12345"), true
assert all_characters_uniq?("123452"), true
assert all_characters_uniq?(""), true
assert all_characters_uniq?("A"), true
assert all_characters_uniq?("123451"), false

# book

def b_all_characters_uniq?(string)
  characters = string.chars #['a', 'b', 'c', 'a']
  char_set = {}
  for i in 0..characters.length
    val = characters[i]
    return false if char_set[val]
    char_set[val] = true
  end

  return true
end

assert all_characters_uniq?("12345"), true
assert all_characters_uniq?(""), true
assert all_characters_uniq?("A"), true
assert all_characters_uniq?("123451"), false
