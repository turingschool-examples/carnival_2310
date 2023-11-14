class Visitor
    attr_reader :name,:height,:spending_money,:preferences

    def initialize(name, height, money)
        @name = name.to_s
        @height = height.to_i
        @spending_money = money[1..money.length-1].to_i
        @preferences = []
    end

    def add_preference(new_preference)
        @preferences.append(new_preference)
    end

    def tall_enough?(required_height)
        if @height >= required_height
            return true
        else
            return false
        end
    end
end