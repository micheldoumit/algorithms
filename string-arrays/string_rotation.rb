require_relative 'helpers'


def rotation?(str1, str2)
  map = {}
  for i in 0..str1.length-1
    map[str1[i]] = i
  end

  current = str2[0]
  for i in 1..str2.length-1
    current_index = map[str2[i]]
    map_index = map[current]
    #puts "current = #{current}, i = #{i}, str2[i] = #{str2[i]}, map[str2[i]] = #{map[str2[i]]}, map[current] = #{map[current]}"
    puts "#{current_index} != #{map_index+1}"
    compare = current_index == 0 ? map_index.length-1 : map_index + 1
    if (current_index != compare) #|| (current == str2.length-1 && str2[i] != 0)
      return false
    end
    current = str2[i]
  end

  true
end


assert(rotation?('amor'.chars, 'oram'.chars), true)
