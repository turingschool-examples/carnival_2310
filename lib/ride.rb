require './lib/visitor.rb'
require 'pry'


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

  def board_rider(visitor)
    if visitor.height >= @min_height && visitor.spending_money >= @admission_fee && visitor.preferences.include?(@excitement)
      
      visitor.spending_money -= @admission_fee
      @rider_log[visitor] ||= 0 # @Kate I figured out a way to utilize memoization here. It adds visitors that are eligable to ride to the rider_log hash.
      @rider_log[visitor] += 1 # updates the number of times the visitor rode the ride.
      @total_revenue += @admission_fee  
    else
      return false
    end
  end


end