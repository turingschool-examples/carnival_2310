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

    def rider_list
        rider_list = []
        @rides.each do |ride|
            ride.rider_log.each do |rider, ride_times|
                if rider_list.include?(rider) == false
                    rider_list.append(rider)
                end
            end
        end
        rider_list
    end

    def visitor_favorite_ride(visitor)
        most_rides = 0
        favorite_ride = nil
        @rides.each do |ride|
            if ride.ride_log.has_key?(visitor)
                if ride.ride_log[visitor] > most_rides
                    favorite_ride = ride
                    most_rides = ride.ride_log[visitor]
                end
            end
        end
        favorite_ride
    end

    def visitor_favorite_ride(visitor)
        most_rides = 0
        favorite_ride = nil
        @rides.each do |ride|
            if ride.ride_log.has_key?(visitor)
                if ride.ride_log[visitor] > most_rides
                    favorite_ride = ride
                    most_rides = ride.ride_log[visitor]
                end
            end
        end
        favorite_ride
    end

    def total_money_spent(visitor)
        total_spent = 0
        @rides.each do |ride|
            if ride.ride_log.has_key?(visitor)
                total_spent += ride.ride_log[visitor]*ride.admission_fee
            end
        end
        total_spent
    end

    def summary
        summary = {}
        summary[visitor_count] = rider_list.length
        summary[revenue_earned] = total_revenue
        summary[visitors] = []
        rider_list.each do |visitor|
            summary[visitors].append({visitor: visitor, favorite_ride: visitor_favorite_ride(visitor), total_money_spent: total_money_spent(visitor)})
        end
        summary[rides] = []
        @rides.each do |ride|
            summary[rides].append({ride: ride, riders: ride.rider_list, total_revenue: ride.total_revenue})
        end
        summary
    end
end