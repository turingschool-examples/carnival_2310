class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :rider_log

  def initialize(ride_details)
    @name = ride_details[:name]
    @min_height = ride_details[:min_height]
    @admission_fee = ride_details[:admission_fee]
    @excitement = ride_details[:excitement]
    @rider_log = Hash.new(0)
  end

  def total_revenue
    @admission_fee * @rider_log.count
  end

  def board_rider(visitor)
    #check if visitor is elligible for ride
    if visitor.tall_enough?(@min_height) &&
      visitor.preferences.include?(@excitement) &&
      visitor.spending_money >= @admission_fee

      # add visitor to rider_log
      if @rider_log[visitor]
        @rider_log[visitor] += 1
      else
        @rider_log[visitor] = 1
      end

      #reduce visitor's spending money
      visitor.spending_money -= @admission_fee
    else
    end

  end

end