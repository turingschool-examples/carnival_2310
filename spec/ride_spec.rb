require './lib/visitor'
require './lib/ride'
require 'pry' 

RSpec.describe Ride do
  describe "#initialize" do
    it "has @name, @min_height, @admission_fee, @excitement" do
      ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

    end
  end
end