require 'rspec'
require_relative "./spec_helper"

describe Carnival do
    before(:all) do
        @carnival = Carnival.new(10)

        @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
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
end