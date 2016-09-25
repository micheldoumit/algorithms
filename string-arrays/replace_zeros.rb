require_relative '../helpers'


#matrix = [[1,0,3],[4,5,6]]
matrix = [
  [0, 1, 2, 3, 4, 5],
  [6, 7, 8, 9, 0, 11],
  [12, 13, 14, 15, 16, 17],
  [18, 19, 20, 21, 22, 23],
  [24, 25, 26, 27, 28, 29],
  [30, 31, 32, 33, 34, 35]
]

expected = [
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 13, 14, 15, 0, 17],
  [0, 19, 20, 21, 0, 23],
  [0, 25, 26, 27, 0, 29],
  [0, 31, 32, 33, 0, 35]
]

# mine take 1
def replace_zeros(matrix)
  columns = {}
  for i in 0..(matrix.length-1)  do
    for j in 0..(matrix[i].length-1) do
      if matrix[i][j] == 0
        columns[j] = true
        replace_row(matrix[i])
        break
      elsif columns[j]
        matrix[i][j] = 0
      end
    end
  end
  matrix
end

def replace_row(row)
  for i in 0..(row.length-1) do
    row[i] = 0
  end
end

assert(replace_zeros(matrix), expected)

matrix = [
  [0, 1, 2, 3, 4, 5],
  [6, 7, 8, 9, 0, 11],
  [12, 13, 14, 15, 16, 17],
  [18, 19, 20, 21, 22, 23],
  [24, 25, 26, 27, 28, 29],
  [30, 31, 32, 33, 34, 35]
]

expected = [
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 13, 14, 15, 0, 17],
  [0, 19, 20, 21, 0, 23],
  [0, 25, 26, 27, 0, 29],
  [0, 31, 32, 33, 0, 35]
]


# book (is it better ?) the complexity is not O(MN) ?
def replace_zeros_book(matrix)
  row = []
  column = []
  for i in 0..(matrix.length-1)  do
    for j in 0..(matrix[0].length-1) do
      if matrix[i][j] == 0
        row[i] = 1
        column[j] = 1
      end
    end
  end

  for i in 0..(matrix.length-1)  do
    for j in 0..(matrix[0].length-1) do
      if row[i] == 1 || column[j] == 1
        matrix[i][j] = 0
      end
    end
  end
  matrix
end

assert(replace_zeros_book(matrix), expected)
