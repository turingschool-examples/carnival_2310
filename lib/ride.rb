require './lib/visitor'

class Ride
    attr_reader :excitement,:min_height,:admission_fee,:total_revenue,:rider_log,:name

    def initialize(ride_info)
        @rider_log = {}
        @excitement = ride_info[:excitement]
        @min_height = ride_info[:min_height]
        @admission_fee = ride_info[:admission_fee]
        @total_revenue = 0
        @name = ride_info[:name]
    end

    def board_rider(rider)
        if rider.height >= @min_height && rider.preferences.include?(@excitement)
            rider.spend_money(@admission_fee)
            if @rider_log.has_key?(rider)
                @rider_log[rider] += 1
            else
                @rider_log[rider] = 1
            end
            @total_revenue += admission_fee
        end
    end
end