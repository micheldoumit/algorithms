require_relative 'helpers'

# mine
 def anagram?(word1, word2)
   map = Array.new(256)
   return false if word1.length != word2.length

   for i in 0..word1.length-1 do
     if map[word1[i].ord] != nil
       map[word1[i].ord] = map[word1[i].ord] + 1
     else
       map[word1[i].ord] = 1
     end
   end

   for i in 0..word2.length-1 do
     if map[word2[i].ord]
       return false if map[word2[i].ord] == 0
        map[word2[i].ord] = map[word2[i].ord] - 1
     else
        return false
     end
   end

   return true
 end

 assert(anagram?('abcd'.chars, 'abcd'.chars), true )
 assert(anagram?('abcd'.chars, 'abdc'.chars), true )
 assert(anagram?('aba'.chars, 'baa'.chars), true )
 assert(anagram?('abobrinha'.chars, 'boarbihna'.chars), true )
 assert(anagram?('aba'.chars, 'baa44'.chars), false )
 assert(anagram?('abast'.chars, 'aba'.chars), false )
