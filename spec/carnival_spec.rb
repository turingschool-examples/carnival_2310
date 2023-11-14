require './lib/visitor.rb'
require './lib/ride.rb'
require './lib/carnival.rb'

RSpec.describe Carnival do
  before :each do
    @carnival1 = Carnival.new(14)

    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')

    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor2.add_preference(:thrilling)
    @visitor3.add_preference(:thrilling)
  end

  describe 'initialize' do
    it 'creates a Carnival object with a given duration' do

    expect(@carnival1.duration).to eq(14)
    end

    it 'creates a carnival object with no rides' do

    expect(@carnival1.rides).to eq([])
    end
  end

  describe 'add ride' do
    it 'can add rides' do
      @carnival1.add_ride(@ride1)

      expect(@carnival1.rides).to contain_exactly(@ride1)
    end
  end


  
end
