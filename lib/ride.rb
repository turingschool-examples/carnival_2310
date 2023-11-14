class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :rider_log

  def initialize(attributes)
    @name = attributes[:name]
    @min_height = attributes[:min_height]
    @admission_fee = attributes[:admission_fee]
    @excitement = attributes[:excitement]
    @rider_log = Hash.new(0)
  end

  def board_rider(visitor)
    if visitor.height >= @min_height && visitor.preferences.include?(@excitement) && visitor.spending_money >= @admission_fee
      visitor.spending_money -= @admission_fee
      @rider_log[visitor] += 1
    end
  end

  def total_revenue
    total = 0
    @rider_log.each do |visitor, rides|
      total += rides * @admission_fee
    end
    total
  end

end