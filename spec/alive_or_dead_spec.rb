# frozen_string_literal: true

require './lib/alive_or_dead'

describe AliveOrDead do
  describe '#asign_status' do
    it 'returns a random assignment of * elements' do
      alive_matrix = AliveOrDead.new(Array.new(rand) { Array.new(rand) { '.' } })
      expect(alive_matrix.assign_status.flatten).to all(include('.').or(include('*')))
    end
  end
end
