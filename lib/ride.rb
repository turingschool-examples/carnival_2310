class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue,
              :rider_log
  def initialize(ride_hash)
    @name = ride_hash[:name]
    @min_height = ride_hash[:min_height]
    @admission_fee = ride_hash[:admission_fee]
    @excitement = ride_hash[:excitement]
    @total_revenue = 0
    @rider_log = Hash.new(0)
  end

  def board_ride(visitor)
    if visitor.height >= @min_height && visitor.spending_money >= @admission_fee && visitor.preferences.include?(@excitement)
      @rider_log[visitor] += 1
      visitor.spending_money -= @admission_fee
      @total_revenue += @admission_fee
    else
      "Rider does not meet requirements."
    end
  end
end
