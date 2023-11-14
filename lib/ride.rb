class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue,
              :rider_log,
              :total_times_road

  def initialize(data)
    @name             = data[:name]
    @min_height       = data[:min_height]
    @admission_fee    = data[:admission_fee]
    @excitement       = data[:excitement]
    @total_revenue    = 0
    @rider_log        = Hash.new(0)
    @total_times_road = 0
  end

  def board_rider(rider)
    if rider.tall_enough?(@min_height) && rider.preferences.include?(@excitement)
      rider_log[rider] += 1
      rider.spending_money -= @admission_fee
      @total_revenue += @admission_fee
      @total_times_road += 1
    end
  end
end