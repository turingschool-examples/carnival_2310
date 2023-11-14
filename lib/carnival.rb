require './lib/visitor'
require './lib/ride'

class Carnival
    attr_reader :duration,:rides

    def initialize(duration)
        @duration = duration
        @rides = []
    end
    
    def add_ride(ride)
        @rides.append(ride)
    end

    def most_popular_ride
        most_riden_ride = nil
        most_riden_ride_ride_count = 0
        @rides.each do |ride|
            total_rides = 0
            ride.rider_log.each do |rider, times_ridden|
                total_rides += times_ridden
            end
            if most_riden_ride_ride_count < total_rides
                most_riden_ride_ride_count = total_rides
                most_riden_ride = ride
            end
        end
        most_riden_ride
    end

    def most_profitable_ride
        most_revenue_ride = nil
        most_revenue = 0
        @rides.each do |ride|
            if ride.total_revenue > most_revenue
                most_revenue_ride = ride
                most_revenue = ride.total_revenue
            end
        end
        most_revenue_ride
    end

    def most_profitable_ride
        most_revenue_ride = nil
        most_revenue = 0
        @rides.each do |ride|
            if ride.total_revenue > most_revenue
                most_revenue_ride = ride
                most_revenue = ride.total_revenue
            end
        end
        most_revenue_ride
    end

    def total_revenue
        revenue = 0
        @rides.each do |ride|
            revenue += ride.total_revenue
        end
        revenue
    end
end