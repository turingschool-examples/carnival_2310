require 'spec_helper'

RSpec.describe Ride do

  describe "#initialize" do 
    it "exists" do 
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      
      expect(ride1).to be_instance_of(Ride)
    end 

    it "can create a hash with respective ride attributes" do 
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      expect(ride1.name).to eq('Carousel')
      expect(ride1.min_height).to eq(24)
      expect(ride1.admission_fee).to eq(1)
      expect(ride1.excitement).to eq (:gentle)
    end 
  end

  it "can track total revenue" do 
    ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    
    expect(ride1.total_revenue).to eq(0)
  end

  
  it "can keep a log of riders boarded and count how many times they rode the ride" do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    visitor2 = Visitor.new('Tucker', 36, '$5')
    visitor1.add_preference(:gentle)
    visitor2.add_preference(:gentle)

    expect(ride.rider_log).to eq({})

    ride1.board_rider(visitor1)

    expect(ride.rider_log).to eq({visitor1 => 1})
    ride1.board_rider(visitor2)
    ride1.board_rider(visitor1)
    expect(ride.rider_log).to eq({visitor1 => 2, visitor2 => 1})


  end

end