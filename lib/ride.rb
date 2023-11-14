

class Ride

  attr_reader :name, :min_height, :admission_fee, :excitement, :total_revenue, :rider_log

  def initialize(hash)
    @name = hash[:name]
    @min_height = hash[:min_height]
    @admission_fee = hash[:admission_fee]
    @excitement = hash[:excitement]
    @rider_log = Hash.new(0)
    @total_revenue = 0
  end

  def board_rider(visitor)
    if visitor.height >= @min_height && 
      visitor.preferences.include?(@excitement) &&
      visitor.spending_money >= @admission_fee
        visitor.spending_money -= @admission_fee
        @total_revenue += @admission_fee
        @rider_log[visitor] += 1
    end
  end

  def total_revenue
    @total_revenue
  end



end