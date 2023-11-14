require 'spec_helper'
require 'rspec'

RSpec.describe Carnival do
  it "exists" do
    carnival_1 = Carnival.new("Boop Carnival", 14)
    expect(carnival_1).to be_a Carnival
  end

  it "has a method that tells carnival duration" do
    carnival_1 = Carnival.new("Boop Carnival", 14)
    expect(carnival_1.duration).to eq(14)
  end

  it "can add rides" do
    carnival_1 = Carnival.new("Boop Carnival", 14)
    expect(carnival_1.rides).to eq([])
  end

  it "has most popular ride method and a most profitable ride method" do
    carnival_1 = Carnival.new("Boop Carnival", 14)
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor3 = Visitor.new('Penny', 64, '$15')
    
    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)

    visitor2.add_preference(:thrilling)
    visitor3.add_preference(:thrilling)

    carnival_1.add_ride(ride1)
    carnival_1.add_ride(ride2)
    carnival_1.add_ride(ride3)
    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride1.board_rider(visitor3)
    ride1.board_rider(visitor1)

    expect(visitor1.spending_money).to eq(8)
    expect(visitor3.spending_money).to eq(15)

    ride2.board_rider(visitor1)
    ride2.board_rider(visitor2)
    ride2.board_rider(visitor3)

    expect(visitor1.spending_money).to eq(3)
    expect(visitor2.spending_money).to eq(4)
    expect(visitor3.spending_money).to eq(15)

    ride3.board_rider(visitor3)
    ride3.board_rider(visitor3)
    ride3.board_rider(visitor3)

    expect(ride1.total_revenue).to eq(3)
    expect(ride2.total_revenue).to eq(5)
    expect(ride3.total_revenue).to eq(6)
    
    expect(carnival_1.most_popular_ride).to eq(ride1)
    expect(carnival_1.most_profitable_ride).to eq(ride3)

  end



end