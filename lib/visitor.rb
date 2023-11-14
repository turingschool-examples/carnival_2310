require 'pry'

class Visitor

  attr_reader :name, :height, :preferences, :spending_money

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @preferences = []
    @spending_money = spending_money.gsub('$', '').to_i
  end

  def add_preference(ride_characteristics_key)
    @preferences << ride_characteristics_key
  end

  def tall_enough?(required_height)
    @height >= required_height
  end

  

end