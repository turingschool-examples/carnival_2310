

class Carnival

  attr_reader :name, :duration, :rides

  def initialize(name, duration)
    @name = name
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
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
    summary_hash = Hash.new
    summary_hash[:visitor_count] = visitor_count
    summary_hash[:revenue_earned] = total_revenue
    summary_hash[:visitors] = visitors_hash
    # summary_hash[rides] = 
    #almost got to this
  end

  def visitor_count
   visitors_array.count
  end

  def visitors_array
    visitors_array = []
    @rides.each do |ride|
      visitors_array << ride.rider_log.keys
    end
    visitors_array.flatten.uniq
  end


  def visitors_hash
    visitors_hash = Hash.new
    visitors_array.each do |visitor|
      visitors_hash[visitor] = {}
      visitors_hash[visitor][:favorite_ride] = visitors_fav_ride(visitor)
      visitors_hash[visitor][:total_money_spent] = visitors_money_spent(visitor)
    end
    visitors_hash
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