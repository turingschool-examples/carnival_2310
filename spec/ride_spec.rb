require './lib/visitor'
require './lib/ride'

RSpec.describe Ride do
  before(:each) do
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
  end

  describe '#initialize' do
    it 'exists' do
      expect(@ride1).to be_a(Ride)
    end
  end
end