require './lib/visitor.rb'
require './lib/ride.rb'
require './lib/carnival.rb'
require 'pry'

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

  describe 'most_popular_ride' do
    it 'can calculate the most popular ride' do

      @carnival1.add_ride(@ride1)
      @carnival1.add_ride(@ride2)
      @carnival1.add_ride(@ride3)

      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)

      @ride3.board_rider(@visitor3)
      @ride3.board_rider(@visitor3)

      expect(@carnival1.most_popular_ride).to eq(@ride1)
    end
  end

  describe 'least_popular_ride' do
    it 'can calculate the least popular ride' do

      @carnival1.add_ride(@ride1)
      @carnival1.add_ride(@ride2)
      @carnival1.add_ride(@ride3)

      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)

      @ride3.board_rider(@visitor3)
      @ride3.board_rider(@visitor3)

      expect(@carnival1.least_popular_ride).to eq(@ride2)
    end
  end

  describe 'most_profitable_ride' do
    it 'can calculate the most profitable ride' do
      @carnival1.add_ride(@ride1)
      @carnival1.add_ride(@ride2)
      @carnival1.add_ride(@ride3)

      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)

      @ride3.board_rider(@visitor3)
      @ride3.board_rider(@visitor3)

      expect(@carnival1.most_profitable_ride).to eq(@ride3)
    end
  end

  describe 'least_profitable_ride' do
    it 'can calculate the least profitable ride' do
      @carnival1.add_ride(@ride1)
      @carnival1.add_ride(@ride2)
      @carnival1.add_ride(@ride3)

      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)

      @ride3.board_rider(@visitor3)
      @ride3.board_rider(@visitor3)

      expect(@carnival1.least_profitable_ride).to eq(@ride2)
    end
  end

  describe 'total_revenues' do
    it 'can calculate total revenue' do
      @carnival1.add_ride(@ride1)
      @carnival1.add_ride(@ride2)
      @carnival1.add_ride(@ride3)

      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)

      @ride3.board_rider(@visitor3)
      @ride3.board_rider(@visitor3)
      binding.pry

      expect(@carnival1.total_revenues).to eq(7)
    end
  end



end
