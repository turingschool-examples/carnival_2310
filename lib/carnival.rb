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
end
