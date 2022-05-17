# frozen_string_literal: true

require './lib/count_neighboors'

describe CountNeighboors do
  describe '#count_neighboors' do
    it 'returns a count of neighboors of a cell' do
      neighboors = CountNeighboors.new
      expect(neighboors.count_neighboors).to eql(Integer)
    end
  end
end