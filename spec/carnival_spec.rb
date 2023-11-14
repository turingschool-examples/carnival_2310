require 'spec_helper'


RSpec.describe Carnival do

  before(:each) do
    @carnival = Carnival.new('Winter Wonderland', 7)
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
  end

  it 'exists' do
    expect(@carnival).to be_an_instance_of(Carnival)
  end

  it 'has attributes' do
    expect(@carnival.name).to eq('Winter Wonderland')
    expect(@carnival.duration).to eq(7)
    expect(@carnival.rides).to eq([])
  end



end