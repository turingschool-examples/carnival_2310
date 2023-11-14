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

end