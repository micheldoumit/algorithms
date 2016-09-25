require_relative 'helpers'


def test(method)
  matrix = [
    [0, 1, 2, 3, 4, 5],
    [6, 7, 8, 9, 10, 11],
    [12, 13, 14, 15, 16, 17],
    [18, 19, 20, 21, 22, 23],
    [24, 25, 26, 27, 28, 29],
    [30, 31, 32, 33, 34, 35]
  ]

  expected = [
    [30,24,18,12,6,0],
    [31,25,19,13,7,1],
    [32,26,20,14,8,2],
    [33,27,21,15,9,3],
    [34,28,22,16,10,4],
    [35,29,23,17,11,5]]

    assert(send(method, matrix), expected)
end

# mine
def rotate_90(image)
  print_array(image)
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
  print_array(result)
  result
end

test('rotate_90')

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

#test('rotate_90_in_place') # fails :-()

def rotate_90_book(matrix)
  size = matrix.length
  layers = size / 2
  for layer in 0..(layers-1) do
    first = layer
    last = size - first - 1
    for element in first..last - 1
      offset = element - layer

      top = matrix[first][element]
      # top <= left
      matrix[first][element] = matrix[last-offset][first]
      # left <= botton
      matrix[last-offset][first] = matrix[last][last-offset]

      # botton <= right
      matrix[last][last-offset] = matrix[element][last]

      # right <= saved top
      matrix[element][last] = top
    end
  end
  print_array(matrix)
  matrix
end

#rotate_90_book([[1,2,3], [4,5,6], [7,8,9]])
#rotate_90_book([[1,2,3,4], [5,6,7,8], [9,10,11,12], [13,14,15,16]])

#test('rotate_90_book')
