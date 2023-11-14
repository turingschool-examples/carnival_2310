require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new(14)
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @@visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
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
  
  describe '#add_ride' do
  it 'adds rides' do
      expect(@carnival.rides).to eq([])
      @carnival.add_ride(@ride1)
      expect(@carnival.rides).to eq([@ride1])
    end
  end

  describe '#most_profitable_ride' do
    it 'returns the ride with the most profit' do
      expect().to eq()
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride2)

      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride2.board_rider(@visitor1)

      expect(@carnival.most_profitable_ride).to eq(@ride1)

    end
  end
end
