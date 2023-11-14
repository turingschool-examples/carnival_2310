require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new(14)

    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')

  end

  it 'exists' do
    expect(@carnival).to be_a(Carnival)
  end

  it 'has readable attributes' do
    expect(@carnival.duration).to eq(14)
    expect(@carnival.list_of_rides).to eq([])
  end

  it "can add rides" do
    @carnival.add_ride(@ride1)

    expect(@carnival.list_of_rides).to eq([@ride1])

    @carnival.add_ride(@ride2)

    expect(@carnival.list_of_rides).to eq([@ride1, @ride2])
  end

  it 'knows the total revenue' do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)

    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor2.add_preference(:thrilling)
    @visitor3.add_preference(:thrilling)

    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)
    @ride3.board_rider(@visitor1)
    @ride3.board_rider(@visitor2)
    @ride3.board_rider(@visitor3)

    expect(@carnival.total_revenue).to eq(5)
  end

  xit 'know the most profitable ride' do
    @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride2)
      @carnival.add_ride(@ride3)

      @visitor1.add_preference(:gentle)
      @visitor2.add_preference(:gentle)
      @visitor2.add_preference(:thrilling)
      @visitor3.add_preference(:thrilling)

      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)
      @ride3.board_rider(@visitor1)
      @ride3.board_rider(@visitor2)
      @ride3.board_rider(@visitor3)

    expect(@carnival.most_profitable_ride).to eq(@ride1)
  end
end