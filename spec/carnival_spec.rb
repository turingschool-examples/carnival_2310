require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do
    it "can make a canrnival" do
        carnival1 = Carnival.new(5)

        expect(carnival1.duration).to eq(5)
        expect(carnival1.rides).to eq([])
    end

    it "carnival can add ride" do
        carnival1 = Carnival.new(5)

        ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

        carnival1.add_ride(ride1)
        carnival1.add_ride(ride2)
        carnival1.add_ride(ride3)

        expect(carnival1.rides).to eq([ride1,ride2,ride3])
    end

    it "carnival can calculate most pupular ride" do
        carnival1 = Carnival.new(5)

        ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
        carnival1.add_ride(ride1)
        carnival1.add_ride(ride2)
        carnival1.add_ride(ride3)

        visitor1 = Visitor.new('Bruce', 54, '$10')
        visitor2 = Visitor.new('Tucker', 36, '$5')
        visitor3 = Visitor.new('Penny', 64, '$15')
        visitor1.add_preference(:gentle)
        visitor2.add_preference(:gentle)
        visitor2.add_preference(:thrilling)
        visitor3.add_preference(:thrilling)

        ride1.board_rider(visitor1)
        ride1.board_rider(visitor2)
        ride1.board_rider(visitor1)
        ride3.board_rider(visitor1)
        ride3.board_rider(visitor2)
        ride3.board_rider(visitor3)

        expect(carnival1.most_popular_ride).to eq(ride1)
    end

    it "carnival can calculate most profitable ride" do
        carnival1 = Carnival.new(5)

        ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
        carnival1.add_ride(ride1)
        carnival1.add_ride(ride2)
        carnival1.add_ride(ride3)

        visitor1 = Visitor.new('Bruce', 54, '$10')
        visitor2 = Visitor.new('Tucker', 36, '$5')
        visitor3 = Visitor.new('Penny', 64, '$15')
        visitor1.add_preference(:gentle)
        visitor2.add_preference(:gentle)
        visitor2.add_preference(:thrilling)
        visitor3.add_preference(:thrilling)

        ride1.board_rider(visitor1)
        ride1.board_rider(visitor2)
        ride1.board_rider(visitor1)
        ride3.board_rider(visitor1)
        ride3.board_rider(visitor2)
        ride3.board_rider(visitor3)

        expect(carnival1.most_profitable_ride).to eq(ride1)

        ride3.board_rider(visitor3)
        ride3.board_rider(visitor3)
        ride3.board_rider(visitor3)

        expect(carnival1.most_profitable_ride).to eq(ride3)
    end

    it "carnival can calculate most pupular ride" do
        carnival1 = Carnival.new(5)

        ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
        carnival1.add_ride(ride1)
        carnival1.add_ride(ride2)
        carnival1.add_ride(ride3)

        visitor1 = Visitor.new('Bruce', 54, '$10')
        visitor2 = Visitor.new('Tucker', 36, '$5')
        visitor3 = Visitor.new('Penny', 64, '$15')
        visitor1.add_preference(:gentle)
        visitor2.add_preference(:gentle)
        visitor2.add_preference(:thrilling)
        visitor3.add_preference(:thrilling)

        ride1.board_rider(visitor1)
        ride1.board_rider(visitor2)
        ride1.board_rider(visitor1)
        ride3.board_rider(visitor1)
        ride3.board_rider(visitor2)
        ride3.board_rider(visitor3)

        expect(carnival1.total_revenue).to eq(5)
    end
end