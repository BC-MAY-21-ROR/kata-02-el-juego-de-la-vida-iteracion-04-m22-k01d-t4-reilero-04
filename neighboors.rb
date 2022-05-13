  class Neighboors
    def neighboors(matriz)
        new_matriz = matriz
        new_matriz.each_with_index.map do |row, x|
          row.each_with_index.map do |column, y|
            neighboors = []
    
            if y == (row.length - 1)
            else
              neighboors.push(row[y + 1])
            end
            neighboors.push(row[y - 1])
    
            if y == row.length - 1
              neighboors.push(new_matriz[x - 1][y - 1], new_matriz[x - 1][y])
            else
              neighboors.push(new_matriz[x - 1][y - 1], new_matriz[x - 1][y],
                              new_matriz[x - 1][y + 1])
            end
    
            if x == (new_matriz.length - 1)
              'none'
            elsif y.zero?
              neighboors.push(row[y + 1])
              neighboors.push(new_matriz[x - 1][y], new_matriz[x - 1][y + 1])
              neighboors.push(new_matriz[x + 1][y], new_matriz[x + 1][y + 1])
            elsif y == (row.length - 1)
              neighboors.push(new_matriz[x + 1][y - 1], new_matriz[x + 1][y])
            else
              neighboors.push(new_matriz[x + 1][y - 1], new_matriz[x + 1][y],
                              new_matriz[x + 1][y + 1])
            end
    
            neighboors.sum
          end
        end
      end
  end


matrix_rpeuba = [[1,0,1,1,0,1]],
                [[1,1,1,0,0,0]],
                [[1,0,0,1,1,1]],
                [[1,1,0,0,0,1]],
                [[1,0,1,0,0,1]]