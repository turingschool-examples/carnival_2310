class Visitor
    attr_reader :name, :height, :spending_money, :preferences

    def initialize(name, height, spending_money)
        @name = name
        @height = 54
        @spending_money = spending_money.delete("$").to_i
        @preferences = []
    end

    def add_preference(preference)
        @preferences << preference.to_sym
    end
end