class Ride
  attr_reader :name, :min_height, :admission_fee, :excitement, :rider_log
  def initialize(attributes)
    @name = attributes[:name]
    @min_height = attributes[:min_height]
    @admission_fee = attributes[:admission_fee]
    @excitement = attributes[:excitement]
    @rider_log = Hash.new(0)
  end

  def total_revenue
    @rider_log.values.sum * @admission_fee
  end

  def board_rider(visitor)
    return unless visitor.tall_enough?(@min_height) && visitor.preferences.include?(@excitement) && visitor.spending_money >= @admission_fee
    @rider_log[visitor] ||= 0
    @rider_log[visitor] += 1
    visitor.spending_money -= @admission_fee
  end
end

