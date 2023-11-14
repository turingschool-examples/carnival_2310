class Carnival
    attr_reader :duration, :rides

    def initialize(duration)
        @duration = duration
        @rides = []
    end

    def add_ride(ride)
        @rides << ride
    end

    def most_popular_ride
        ride_with_times_ridden = {}
        @rides.map do |ride|
            total_times_ridden = 0
            ride.rider_log.map do |rider, times_ridden|
                total_times_ridden += times_ridden
            end
            ride_with_times_ridden[ride] = total_times_ridden
        end
        ride_with_times_ridden.sort_by {|ride, times_ridden| times_ridden}.last[0]
    end
end