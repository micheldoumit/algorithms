require_relative 'helpers'

# mine
def rotate_90(image)
  result = [[],[]]
  n = image.length - 1
  for x in 0..n
    for y in 0..n
      current = image[x][y]
      #puts "processing: [#{x}, #{y}] = #{current} to position: [#{y},#{n-x}]"
      result[y][n-x] = current
    end
  end

  result
end

assert(rotate_90([[3,1],[4,2]]), [[4,3],[2,1]])

# mine take 2 (in place)

def rotate_90_in_place(array)
  process(array, 0, array.length-1, array[0][array.length-1])
end

def process(array, x, y, value)
 puts "array: #{array}, x: #{x} y: #{y} value: #{value}"
 tx, ty = y, array.length-1-x
 old_value = array[tx][ty]
 array[tx][ty] = value
 return array if tx == 0 && ty == array.length - 1
 process(array, tx, ty, old_value)
end


assert(rotate_90_in_place([[3,1],[4,2]]), [[4,3],[2,1]])