require_relative 'helpers'

# mine
def rotate_90(image)
  result = []
  image.length.times { result << [] }
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

#assert(rotate_90([[1,2,3],[4,5,6],[7,8,9]]), [[7,4,1],[8,5,2],[9,6,3]])

# mine take 2 (in place)

def rotate_90_in_place(array)
  print_array(array)
  process(array, 0, array.length-1, array[0][array.length-1])
  print_array(array)
end

def process(array, x, y, value)
 tx, ty = y, array.length-1-x
 old_value = array[tx][ty]
 array[tx][ty] = value
 return array if tx == 0 && ty == array.length - 1
 process(array, tx, ty, old_value)
end


#assert(rotate_90_in_place([[1,2,3],[4,5,6],[7,8,9]]), [[7,4,1],[8,5,2],[9,6,3]])


# def rotate_90_book(matrix)
#   print_array(matrix)
#   n = 2
#   for layer in 0..(n/2) do
#     first = layer
#     last = n - 1 - layer
#     for i in first..last do
#       break if i >= last
#       puts "#{i}"
#       offset = i - first
#       top = matrix[first][i]
#       matrix[first][i] = matrix[last-offset][first]
#       matrix[last-offset][first] = matrix[last][last-offset]
#       matrix[last][last-offset] = matrix[i][last]
#       matrix[i][last] = top
#     end
#   end
#   print_array(matrix)
#   matrix
# end

def rotate_90_book(matrix)
  print_array(matrix)
  size = matrix.length
  layers = size / 2
  for layer in 0..(layers-1) do
    first = layer
    last = size - first - 1
    for element in first..last - 1
      # offset = element - first ?

      top_left = matrix[first][element]
      top_right = matrix[element][last]
      botton_left = matrix[last-element][first]
      botton_right = matrix[last][last-element]

      matrix[first][element] = botton_left
      matrix[element][last] = top_left
      matrix[last-element][first] = botton_right
      matrix[last][last-element] = top_right

    end
  end
  print_array(matrix)
  matrix
end

matrix = [
[0, 1, 2],
[3, 4, 5],
[6, 7, 8]
]
rotate_90_book(matrix)
#assert(rotate_90_book([[1,2,3],[4,5,6],[7,8,9]]), [[7,4,1],[8,5,2],[9,6,3]])
