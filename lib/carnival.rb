

class Carnival

  attr_reader :name, :duration, :rides

  def initialize(name, duration)
    @name = name
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
    # if !@rides.include?(ride)
    #   @rides << ride
    # else
    #   @rides
    # end
  end

  def most_popular_ride
    @rides.max_by do |ride|
      ride.rider_log.values.sum
    end
  end

  def most_profitable_ride
    @rides.max_by do |ride|
      ride.total_revenue
    end
  end

  def total_revenue
    @rides.map.sum do |ride|
      ride.total_revenue
    end
  end


  def summary


  end


  def ride_total_revenue(ride)
    ride.total_revenue
  end

  def rides_riders(ride)
    ride.rider_log
  end

  def visitors_fav_ride(visitor)
    @rides.max_by do |ride|
      ride.rider_log[visitor]
    end
  end

  def visitors_money_spent(visitor)
    visitor.original_spending_money - visitor.spending_money
  end


end