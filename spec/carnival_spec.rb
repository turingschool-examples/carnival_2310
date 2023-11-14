require 'spec_helper'


RSpec.describe Carnival do

  before(:each) do
    @carnival = Carnival.new('Winter Wonderland', 7)
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
  end

  it 'exists' do
    expect(@carnival).to be_an_instance_of(Carnival)
  end

  it 'has attributes' do
    expect(@carnival.name).to eq('Winter Wonderland')
    expect(@carnival.duration).to eq(7)
    expect(@carnival.rides).to eq([])
  end

  it 'can add rides to the array' do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)

    expect(@carnival.rides).to eq([@ride1, @ride2])
  end

  it 'can tell us the most popular ride: part one' do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)

    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor1)
    @ride2.board_rider(@visitor2)

    expect(@carnival.most_popular_ride).to eq(@ride1)
  end
  
  it 'can tell us the most popular ride: part deux' do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)

    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride2.board_rider(@visitor2)
    @ride2.board_rider(@visitor2)
    @ride2.board_rider(@visitor2)
    @ride2.board_rider(@visitor2)
    @ride2.board_rider(@visitor2)
    @ride2.board_rider(@visitor2)

    expect(@carnival.most_popular_ride).to eq(@ride1)
  end

end