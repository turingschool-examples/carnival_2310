require 'spec_helper'

RSpec.describe Ride do

  before(:each) do
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
  end

  it 'exists' do
    expect(@ride1).to be_an_instance_of(Ride)
  end
  
  it 'has attributes' do
    expect(@ride1.name).to eq('Carousel')
    expect(@ride1.min_height).to eq(24)
    expect(@ride1.admission_fee).to eq(1)
    expect(@ride1.excitement).to eq(:gentle)
    expect(@ride1.total_revenue).to eq(0)
  end

  it 'can board riders into the rider log' do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @ride1.board_rider(visitor1)
    @ride1.board_rider(visitor2)
    @ride1.board_rider(visitor1)

    expect(@ride1.rider_log).to eq({'#<Visitor:0x000000015a16e918 @height=54, @name="Bruce", @preferences=[:gentle], @spending_money=8> => 2,
    #<Visitor:0x000000015a11c5c8 @height=36, @name="Tucker", @preferences=[:gentle], @spending_money=4> => 1'})
  end

end