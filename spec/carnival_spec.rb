require 'spec_helper'

RSpec.describe Carnival do

  it 'exists' do
    carnival = Carnival.new(14)

    expect(carnival).to be_a(Carnival)
    expect(carnival.duration).to eq(14)
    expect(carnival.rides).to eq([])
  end

  it 'can add rides' do
    carnival = Carnival.new(14)

    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })

    carnival.add_ride(ride1)
    
    expect(carnival.rides).to eq([ride1])

    carnival.add_ride(ride2)
    
    expect(carnival.rides).to eq([ride1, ride2])
  end

end