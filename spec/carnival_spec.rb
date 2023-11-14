require 'spec_helper'

RSpec.describe Carnival do

  it 'exists' do
    carnival = Carnival.new(14)

    expect(carnival).to be_a(Carnival)
    expect(carnival.duration).to eq(14)
    expect(carnival.rides).to eq([])
  end

  it 'can add rides' do
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    
    carnival = Carnival.new(14)

    carnival.add_ride(ride1)
    
    expect(carnival.rides).to eq([ride1])

    carnival.add_ride(ride2)
    
    expect(carnival.rides).to eq([ride1, ride2])
  end

  it 'can calculate the total revenue earned from all its rides' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor3 = Visitor.new('Penny', 64, '$15')

    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    visitor3.add_preference(:gentle)
    
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    
    carnival = Carnival.new(14)

    carnival.add_ride(ride1)
    carnival.add_ride(ride2)

    ride1.board_rider(visitor1) # total = 1
    ride1.board_rider(visitor2) # total = 2
    ride1.board_rider(visitor3) # total = 3

    ride2.board_rider(visitor1) # total = 8
    ride2.board_rider(visitor3) # total = 13
    ride2.board_rider(visitor3) # total = 18

    expect(carnival.total_revenue).to eq(18)
  end

  it 'can return its most profitable ride' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor3 = Visitor.new('Penny', 64, '$15')

    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)
    visitor3.add_preference(:gentle)
    
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    
    carnival = Carnival.new(14)

    carnival.add_ride(ride1)
    carnival.add_ride(ride2)

    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride1.board_rider(visitor3) # ride_1 total = 3

    ride2.board_rider(visitor1)
    ride2.board_rider(visitor3)
    ride2.board_rider(visitor3) # ride_2 total = 15

    expect(carnival.most_profitable_ride).to eq(ride2)
  end

end