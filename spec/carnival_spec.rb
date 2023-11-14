require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new(14)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@carnival).to be_a(Carnival)
    end
  end

  describe '#attributes' do
    it 'reads and returns attributes' do
      expect(@carnival.duration).to eq(14)
      expect(@carnival.rides).to eq([])

    end
  end
end
