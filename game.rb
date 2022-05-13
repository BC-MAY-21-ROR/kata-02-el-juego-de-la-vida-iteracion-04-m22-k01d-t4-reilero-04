# frozen_string_literal: true

require 'colorize'
require_relative 'matrix'
require_relative 'codified_matrix'

class Game
  def initialize(height, width, generations)
    @height = height
    @width = width
    @matrices = generations
  end

  def play
    # @matrices = 50
    print "First Generation\n"
    first_matrix = print_codified_matrix(Matrix.new(height, width).create)

    @matrices.times do
      sleep(0.15)
      first_matrix = print_codified_matrix(dead_or_alive(first_matrix))
    end
  end

  def print_codified_matrix(matrix)
    matrix.each do |array|
      array.each do |elemento|
        if elemento == 1
          print ' * '.white
        else
          print ' . '.black
        end
      end
      print "\n"
    end
  end

  def dead_or_alive(matriz)
    new_matriz = Array.new(matriz.length) { Array.new(matriz[0].length) {} }
    neighboors(matriz).each_with_index do |vecinos, index_vecinos|
      vecinos.each_with_index do |vecino, index_vecino|
        matriz.each_with_index do |celulas, index_celulas|
          celulas.each_with_index do |celula, index_celula|
            next unless index_celula == index_vecino && index_celulas == index_vecinos

            new_matriz[index_celulas][index_celula] = if celula == 1
                                                        if vecino > 3 || vecino < 2
                                                          0
                                                        else
                                                          1
                                                        end
                                                      elsif vecino == 3
                                                        1
                                                      else
                                                        0
                                                      end
          end
        end
      end
    end
    print "\e[2J\e[H"
    # print_codified_matriz(new_matriz)
    new_matriz
  end

  def neighboors(matriz)
    new_matriz = matriz
    new_matriz.each_with_index.map do |array, index_array|
      array.each_with_index.map do |_celula, index_celula|
        neighboors = []

        if index_celula == (array.length - 1)
        else
          neighboors.push(array[index_celula + 1])
        end
        neighboors.push(array[index_celula - 1])

        if index_celula == array.length - 1
          neighboors.push(new_matriz[index_array - 1][index_celula - 1], new_matriz[index_array - 1][index_celula])
        else
          neighboors.push(new_matriz[index_array - 1][index_celula - 1], new_matriz[index_array - 1][index_celula],
                          new_matriz[index_array - 1][index_celula + 1])
        end

        if index_array == (new_matriz.length - 1)
          'none'
        elsif index_celula.zero?
          neighboors.push(array[index_celula + 1])
          neighboors.push(new_matriz[index_array - 1][index_celula], new_matriz[index_array - 1][index_celula + 1])
          neighboors.push(new_matriz[index_array + 1][index_celula], new_matriz[index_array + 1][index_celula + 1])
        elsif index_celula == (array.length - 1)
          neighboors.push(new_matriz[index_array + 1][index_celula - 1], new_matriz[index_array + 1][index_celula])
        else
          neighboors.push(new_matriz[index_array + 1][index_celula - 1], new_matriz[index_array + 1][index_celula],
                          new_matriz[index_array + 1][index_celula + 1])
        end

        neighboors.sum
      end
    end
  end

  private

  attr_reader :height, :width
end


new_game = Game.new(20, 20, 1500)
new_game.play
