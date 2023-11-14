class Ride
    attr_reader :name, :min_height, :admission_fee, :excitement, :total_revenue, :rider_log

    def initialize(ride_hash)
        @name = ride_hash[:name]
        @min_height = ride_hash[:min_height]
        @admission_fee = ride_hash[:admission_fee]
        @excitement = ride_hash[:excitement]
        @total_revenue = 0
        @rider_log = {}
    end

    def board_rider(visitor)
        if visitor.height >= @min_height && visitor.spending_money >= @admission_fee && visitor.preferences.include?(@excitement)
            @rider_log[visitor] ||= 0
            @rider_log[visitor] += 1
            visitor.charge_money(@admission_fee)
            @total_revenue += @admission_fee
        end
    end
end