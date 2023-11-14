require 'spec_helper'

RSpec.describe Ride do

  it 'exists' do
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

    expect(ride1).to be_a(Ride)
    expect(ride1.name).to eq("Carousel")
    expect(ride1.min_height).to eq(24)
    expect(ride1.admission_fee).to eq(1)
    expect(ride1.excitement).to eq(:gentle)
    expect(ride1.rider_log).to eq({})
    expect(ride1.total_revenue).to eq(0)
  end

  it 'can return total revenue' do
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
  
    expect(ride1.total_revenue).to eq(0)

    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor1.add_preference(:gentle)
    ride1.board_rider(visitor1)

    expect(ride1.total_revenue).to eq(1)

    ride1.board_rider(visitor1)

    expect(ride1.total_revenue).to eq(2)
  end

  it 'can determine elligibility for ride' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor3 = Visitor.new('Penny', 64, '$15')
    visitor4 = Visitor.new('Meg', 64, '$1')
    
    visitor2.add_preference(:thrilling)
    visitor3.add_preference(:thrilling)
    visitor4.add_preference(:thrilling)
    
    ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

    expect(ride3.eligible?(visitor2)).to eq(false) # not elligible to ride due to min height
    expect(ride3.eligible?(visitor1)).to eq(false) # not elligible to ride due to excitement
    expect(ride3.eligible?(visitor4)).to eq(false) # not elligible to ride due to spending_money
    expect(ride3.eligible?(visitor3)).to eq(true) # elligible to ride
  end

  it 'can add visitor to rider log' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')

    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

    expect(ride1.rider_log).to eq({}) # rider_log is empty upon instatiation

    ride1.add_visitor_to_rider_log(visitor1)

    expect(ride1.rider_log).to eq({visitor1 => 1}) # visitor1 was added to rider_log

    ride1.add_visitor_to_rider_log(visitor2)

    expect(ride1.rider_log).to eq({visitor1 => 1, visitor2 => 1}) # visitor2 was added to rider_log

    ride1.add_visitor_to_rider_log(visitor2)

    expect(ride1.rider_log).to eq({visitor1 => 1, visitor2 => 2}) # visitor2 ride count was increased
  end

  it 'can reduce visitor spending money' do
    visitor1 = Visitor.new('Bruce', 54, '$10')

    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    
    ride1.reduce_visitor_spending_money(visitor1)

    expect(visitor1.spending_money).to eq(9)

    ride3.reduce_visitor_spending_money(visitor1)

    expect(visitor1.spending_money).to eq(7)
  end

  it 'can board rider' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')

    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)

    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

    ride1.board_rider(visitor1)
    ride1.board_rider(visitor2)
    ride1.board_rider(visitor1)

    expect(ride1.rider_log).to eq({visitor1=> 2, visitor2 => 1})
    expect(visitor1.spending_money).to eq(8)
    expect(visitor2.spending_money).to eq(4)
    expect(ride1.total_revenue).to eq(3)
  end

  it 'can prevent riders from boarding if elligibility requirements are not met' do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor3 = Visitor.new('Penny', 64, '$15')
    
    visitor2.add_preference(:thrilling)
    visitor3.add_preference(:thrilling)
    
    ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

    ride3.board_rider(visitor1) # not elligible to ride due to excitement
    ride3.board_rider(visitor2) # not elligible to ride due to min height
    ride3.board_rider(visitor3) # elligible to ride

    expect(visitor3.spending_money).to eq(13) # reduced by 2
    expect(ride3.rider_log).to eq({visitor3 => 1})
    expect(ride3.total_revenue).to eq(2) # since only visitor 3 was elligible
  end

end