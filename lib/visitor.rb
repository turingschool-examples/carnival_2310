

class Visitor

  attr_reader :name, :height, :preferences, :spending_money

  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @preferences = []
    @spending_money = spending_money
  end

end