require 'rspec'
require_relative "./spec_helper"

describe Carnival do
    before(:all) do
        @carnival = Carnival.new(10)

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
        @visitor3.add_preference(:gentle)
    end

    it "exists" do
        expect(@carnival).to be_a Carnival
    end

    it "stores and reads a duration argument" do
        expect(@carnival.duration).to eq(10)
    end

    it "stores and reads a list of rides" do
        expect(@carnival.rides).to eq([])

        @carnival.add_ride(@ride1)
        @carnival.add_ride(@ride2)

        expect(@carnival.rides).to eq([@ride1, @ride2])
    end

    it "returns the most_popular_ride" do
        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor2)
        @ride1.board_rider(@visitor1)

        @ride2.board_rider(@visitor1)
        @ride2.board_rider(@visitor3)

        expect(@carnival.most_popular_ride).to eq(@ride1)
    end

    it "returns the most_profitable_ride" do
        @ride1.board_rider(@visitor1)
        @ride1.board_rider(@visitor2)
        @ride1.board_rider(@visitor1)

        @ride2.board_rider(@visitor1)
        @ride2.board_rider(@visitor3)

        expect(@carnival.most_profitable_ride).to eq(@ride2)
    end

    it "returns the total_revenue from all rides" do

        expect(@carnival.total_revenue).to eq(21)

        @ride1.board_rider(@visitor2)

        expect(@carnival.total_revenue).to eq(22)
    end
end