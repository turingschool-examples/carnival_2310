require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new(14)
    @@ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
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
      carnival.add_ride(@ride1)
      expect(@carnival.rides).to eq([@ride1])
    end
  end
end
