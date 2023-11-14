require './lib/visitor.rb'
require './lib/ride.rb'

class Carnival

  attr_reader :duration, :rides

  def initialize(duration)
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def most_popular_ride
    @rides.max_by do |ride|
      ride.rider_log.keys.length
    end
  end

  def least_popular_ride
    @rides.min_by do |ride|
      ride.rider_log.keys.length
    end
  end

  def most_profitable_ride
    @rides.max_by do |ride|
      ride.total_revenue
    end
  end

  def least_profitable_ride
    @rides.min_by do |ride|
      ride.total_revenue
    end
  end

  def summary
    
  end
end