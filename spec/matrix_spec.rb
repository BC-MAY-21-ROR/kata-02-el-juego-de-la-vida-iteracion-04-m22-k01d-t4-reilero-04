# frozen_string_literal: true

require './lib/matrix'

describe Matrix do
  describe '#create' do
    it 'returns an array with height == to first parameter' do
      matrix = Matrix.new(10, 10)
      expect(matrix.create.length).to eql(10)
    end

    it 'returns a bidimensional array with height == to first parameter and width == to second parameter' do
      matrix = Matrix.new(10, 10)
      expect(matrix.create.flatten.length).to eql(100)
    end

    it 'returns a bidimensional array with only . as its elements' do
      matrix = Matrix.new(10, 10)
      expect(matrix.create.flatten).to all(be_a(String).and(include('.')))
    end
  end
end
