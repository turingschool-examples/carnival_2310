class Ride
  attr_reader :name, 
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue,
              :rider_log
  
  def initialize(attributes)
    @name = attributes[:name]
    @min_height = attributes[:min_height]
    @admission_fee = attributes[:admission_fee]
    @excitement = attributes[:excitement]
    @total_revenue = 0
    @rider_log = {}
  end

  def board_rider(visitor)
    if !@rider_log.include?(visitor)
      @rider_log[visitor] = 1
    else
      @rider_log[visitor] += 1
    end
  end

  # visitor.spending_money -= 1(admission_fee) if ride1.board_rider
  def ride_cost
    if visitor.ride
      
    end

  end
end