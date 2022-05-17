# frozen_string_literal: true

# The Matrix class is responsible for create a base table with a bidimensional array
class Matrix
  def initialize(height, width)
    @height = height
    @width = width
  end

  def create
    Array.new(@height) { Array.new(@width) { '.' } }
  end
end
