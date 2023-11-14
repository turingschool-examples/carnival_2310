class Carnival
  attr_reader :duration,
              :rides

  def initialize(duration)
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides << ride if !@rides.include?(ride)
  end

  def total_revenue
    @rides.sum do |ride|
      ride.total_revenue
    end
  end

  def most_profitable_ride
    ride_revenues = {} # ride => total_revenue

    @rides.map do |ride|
      ride_revenues[ride] = ride.total_revenue 
    end
    
    most_profitable = ride_revenues.max_by {|ride, total_revenue| total_revenue}
    most_profitable[0]
  end

  def most_popular_ride
    ride_counts = {} # ride => total_rides

    @rides.map do |ride|
      total_times_ridden = ride.rider_log.values.sum { |times_ridden| times_ridden }
      ride_counts[ride] = total_times_ridden
    end
    
    most_popular = ride_counts.max_by {|ride, total_rides| total_rides}
    most_popular[0]
  end

end