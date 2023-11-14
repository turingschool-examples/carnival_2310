require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do
  describe 'initialize' do
    it 'exists' do
      carnival = Carnival.new(14)

      expect(carnival).to be_a Carnival
    end

    it 'has a @duration and @rides attribute' do
      carnival = Carnival.new(14)

      expect(carnival.duration).to eq(14)
      expect(carnival.rides).to eq([])
    end
  end
end
