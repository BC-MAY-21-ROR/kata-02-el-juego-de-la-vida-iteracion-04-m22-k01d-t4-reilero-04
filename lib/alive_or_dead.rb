# frozen_string_literal: true

class AliveOrDead
  def initialize(matrix)
    @matrix = matrix
  end

  def assign_status
    status = ['.', '*']
    @matrix.map do |family|
      family.map do |cell|
        @matrix[family][cell] = status.sample
      end
    end
  end
end
