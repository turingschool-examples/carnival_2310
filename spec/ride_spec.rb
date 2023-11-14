require './lib/visitor'
require './lib/ride'
require 'pry' 

RSpec.describe Ride do
  describe "#initialize" do
    it "has @name, @min_height, @admission_fee, @excitement" do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

    expect(ride1).to be_an_instance_of(Ride)
    expect(ride1.name).to eq("Carousel")
    expect(ride1.min_height).to eq(24)
    expect(ride1.admission_fee).to eq(1)
    expect(ride1.excitement).to eq(:gentle)
    expect(ride1.total_revenue).to eq(0)
    end

    it "has visitors with preferences" do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      visitor1 = Visitor.new('Bruce', 54, '$10')
      visitor2 = Visitor.new('Tucker', 36, '$5')
      
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)

      expect(visitor1.preferences).to eq([:gentle])
      expect(visitor2.preferences).to eq([:gentle])
      
      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)

      expect(ride1.rider_log).to eq({visitor1 => 1, visitor2 => 1})
      #expect(ride1.rider_log).to eq({visitor1, visitor2})
      

    end
  end
end