class Carnival
  attr_reader :duration,
              :list_of_rides

  def initialize(duration)
    @duration = duration
    @list_of_rides = []
  end

  def add_ride(ride)
    @list_of_rides << ride
  end

  def total_revenue
    revenue = 0
    @list_of_rides.each do |ride|
       revenue += ride.total_revenue
    end
    revenue
  end

  # def most_profitable_ride
  #   rev_ride = []
  #   @list_of_rides.each do |ride|
  #     if ride.total_revenue 
  #     require 'pry'; binding.pry
  #   end
  # end
end

  # def most_profitable_ride
  #   # profitable_ride = []
  #   # profit = 0
  #   # @list_of_rides.each do |ride|
  #   #   require 'pry'; binding.pry
  #   #   if ride.rider_log.values.sum * ride.admission_fee > best_profit
        
  #   #   end
  #   # end
  #   # most_profitable_ride
  # end


# it occured to me that I could have done the same thing I did for my total revenue method here but for times rode. I also realize I spelt rode road. I didn't realise it till i stoped and was cleaning up things for the last5 mins or so. I left these notes here so you can see sorta what I was trying to do before. 

# def most_popular_ride
# most_popular = nil
# max_riders = 0

# @list_of_rides.each do |ride|
#  total_riders = ride.rider_log.values.sum
#   if total_riders > max_riders
#     most_popular = ride
#   end
# end
# most_popular
# end
# end