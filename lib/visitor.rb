require 'pry'

class Visitor

  attr_reader :name, :height, :preferences
  attr_accessor :spending_money

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @preferences = []
    @spending_money = spending_money.gsub('$', '').to_i
  end

  def add_preference(excitement)
    @preferences << excitement
  end

  def tall_enough?(required_height)
    @height >= required_height
  end



end