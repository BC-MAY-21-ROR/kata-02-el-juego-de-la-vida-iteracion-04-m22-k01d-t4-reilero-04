# frozen_string_literal: true

# class Matrix
#   # def initialize(height, width)
#   #   @height = height
#   #   @width = width
#   # end

#   def create(height, width)
#     Array.new(height) { Array.new(width) { '.' } }
#   end

#   private

#   attr_reader :height, :width
# end

class Matrix
  def initialize(height, width)
    @height = height
    @width = width
  end

  def create
    Array.new(@height) { Array.new(@width) { '.' } }
  end
end
