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

  describe '#most_popular_ride' do
    it 'returns the most popular ride by ride count' do
      carnival = Carnival.new(14)
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')

      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)

      ride1.board_ride(visitor1)
      ride1.board_ride(visitor2)
      ride1.board_ride(visitor1)

      expect(ride1.rider_log).to eq({visitor1 => 2, visitor2 => 1})
      expect(visitor1.spending_money).to eq(8)
      expect(visitor2.spending_money).to eq(4)
      expect(ride1.total_revenue).to eq(3)

      visitor3 = Visitor.new('Penny', 64, '$15')
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

      carnival.add_ride(ride1)
      carnival.add_ride(ride2)
      carnival.add_ride(ride3)

      visitor2.add_preference(:thrilling)
      visitor3.add_preference(:thrilling)
      visitor1.add_preference(:thrilling)

      ride3.board_ride(visitor1)
      ride3.board_ride(visitor1)
      ride3.board_ride(visitor1)
      ride3.board_ride(visitor2)
      ride3.board_ride(visitor2)
      ride3.board_ride(visitor3)
      ride3.board_ride(visitor3)

      expect(carnival.most_popular_ride).to eq(ride3)
    end
  end

  describe '#most_profitable_ride' do
    it 'returns the ride with highest earning' do
      carnival = Carnival.new(14)
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 54, '$12')
      visitor2 = Visitor.new('Tucker', 36, '$5')

      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)

      ride1.board_ride(visitor1)
      ride1.board_ride(visitor2)
      ride1.board_ride(visitor1)

      expect(ride1.rider_log).to eq({visitor1 => 2, visitor2 => 1})
      expect(visitor1.spending_money).to eq(10)
      expect(visitor2.spending_money).to eq(4)
      expect(ride1.total_revenue).to eq(3)

      visitor3 = Visitor.new('Penny', 64, '$15')
      ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
      ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

      visitor3.add_preference(:gentle)

      carnival.add_ride(ride1)
      carnival.add_ride(ride2)
      carnival.add_ride(ride3)

      ride2.board_ride(visitor1)
      ride2.board_ride(visitor1)
      ride2.board_ride(visitor3)
      ride2.board_ride(visitor3)
      ride2.board_ride(visitor3)

      expect(carnival.most_profitable_ride).to eq(ride2)
    end
  end
end
