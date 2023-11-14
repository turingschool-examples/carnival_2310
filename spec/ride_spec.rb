require 'spec_helper'

RSpec.describe Ride do

  describe "#initialize" do 
    it "exists" do 
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      
      expect(ride1).to be_instance_of(Ride)
    end 

    it "has name, min_height, admission_fee, excitement, as instance values within a hash" do 
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
      expect(ride1.name).to eq("Carousel")
      expect(ride1.min_height).to eq(24)
      expect(ride1.admission_fee).to eq(1)
      expect(ride1.excitement).to eq (:gentle)
    end 
  end


end