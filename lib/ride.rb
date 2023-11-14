class Ride 

  attr_reader :name, 
              :min_height,
              :admission_fee,
              :excitement, 
              :total_revenue,
              :rider_log

  def initialize(ride_details)

    @name = ride_details[:name]
    @min_height = ride_details[:min_height]
    @admission_fee = ride_details[:admission_fee]
    @excitement = ride_details[:excitement]
    @total_revenue = 0
    @rider_log = {}
  end

  #A rider does not board if they are 
  #not tall enough 
  #or do not have a matching preference for the ride's excitement level 
  #or do not have enough spending money left.
  def board_rider(rider)
    if !rider.tall_enough?(@min_height)
      return "#{rider.name} doesn't meet rides height requirements"
    elsif rider.spending_money.to_f < @admission_fee
      return "#{rider.name} does not have enough spending money to ride the ride. Sorry!"
    elsif !rider.preferences.include?(@excitement)
      return "#{rider.name} does not prefer this kind of ride."

    else
      @rider_log[rider.name] = rider
      @total_revenue += @admission_fee
      rider.charge_admission(@admission_fee)
      @rider_log
    end 
  end 
end 

  