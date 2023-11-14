class Visitor
  attr_reader :name, :height, :spending_money, :preferences
  attr_accessor :spending_money
  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.delete('$,').to_i
    @preferences = []
  end

  def add_preference(prefrence)
    @preferences << prefrence
  end

  def tall_enough?(height)
    @height >= height
  end
end