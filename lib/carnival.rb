class Carnival
  attr_reader :duration,
              :rides
  def initialize(duration)
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def most_popular_ride
    @rides.max do |ride|
      ride.total_revenue / ride.admission_fee
    end
  end

  def most_profitable_ride
    @rides.max do |ride|
      ride.total_revenue
    end
  end

  def total_revenue_from_all_rides
    @rides.sum do |ride|
      ride.total_revenue
    end
  end

  def summary
    visitors_arr = []
    summary_hash = {}
    @rides.each do |ride|
      visitors_arr << ride.rider_log.keys
        summary_hash[:visitor_count] = visitors_arr.flatten.uniq.count
    end
    summary_hash[:revenue_total] = total_revenue_from_all_rides
    summary_hash
  end
end
