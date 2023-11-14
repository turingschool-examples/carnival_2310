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
    #Add to rider_log[visitor] += num_rides accumulated

    #add rider if rider isn't in hash.  If rider is in hash, += rides_accumulated
  
  end
end