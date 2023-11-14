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

  describe '#add_ride' do
    it 'adds ride instance to @rides attribute array' do
      carnival = Carnival.new(14)
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

      carnival.add_ride(ride1)
      carnival.add_ride(ride2)
      carnival.add_ride(ride3)

      expect(carnival.rides).to eq([ride1, ride2, ride3])
    end
  end

end
