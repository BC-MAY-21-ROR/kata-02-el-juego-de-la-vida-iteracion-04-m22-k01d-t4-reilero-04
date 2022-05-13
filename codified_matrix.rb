# require 'colorize'
require_relative 'matrix'

class PrintCodifiedMatrix
  def printing(matrix)
    matrix.each do |array|
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

new_print = PrintCodifiedMatrix.new
new_print.printing(Matrix.new(30,50).create)

