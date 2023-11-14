

class Ride
  attr_reader :name, :min_height, :admission_fee, :excitement, :rider_log, :total_revenue

  def initialize(ride_stats)
    @name = ride_stats[:name]
    @min_height = ride_stats[:min_height]
    @admission_fee = ride_stats[:admission_fee]
    @excitement = ride_stats[:excitement]
    @rider_log = {}
    @total_revenue = 0
  end


end