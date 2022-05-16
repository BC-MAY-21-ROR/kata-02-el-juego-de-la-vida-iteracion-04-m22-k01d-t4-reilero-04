# frozen_string_literal: true

# require 'colorize'
require_relative 'matrix'

class PrintCodifiedMatrix
  def initialize(matrix)
    @matrix = matrix
  end

  def printing
    @matrix.each do |array|
      array.each do |elemento|
        if elemento == 1
          print ' * '
        else
          print ' . '
        end
      end
      print "\n"
    end
  end
end

new_print = PrintCodifiedMatrix.new(Matrix.new(30, 50).create).printing
