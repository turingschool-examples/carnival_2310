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

    def most_profitable_ride
        ride_with_total_revenue = {}
        @rides.map do |ride|
            ride_with_total_revenue[ride] = ride.total_revenue
        end
        ride_with_total_revenue.sort_by {|ride, total_revenue| total_revenue}.last[0]
    end

    def total_revenue
        @rides.sum { |ride| ride.total_revenue }
    end

    def summary
        summary_hash = {
            visitor_count: 0,
            revenue_earned: total_revenue,
            visitors: [],
            rides: []
        }
        visitors = []

        @rides.map do |ride|
            visitor_summary_hash = {}
            ride.rider_log.map do |rider, times_ridden|
                visitor_summary_hash[:visitor] ||= rider
                if visitor_summary_hash[:total_money_spent]
                    visitor_summary_hash[:total_money_spent] += 
                end
                    visitor: rider,
                    favorite_ride: 
                }
            end
        end
    end
end