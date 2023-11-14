require './lib/visitor'
require 'pry' 

RSpec.describe Visitor do
  describe "#initialize" do
    it "has @name, @height, @preferences" do
      visitor1 = Visitor.new('Bruce', 54, '$10')

      expect(visitor1).to be_an_instance_of(Visitor)
      expect(visitor1.name).to eq("Bruce")
      expect(visitor1.height).to eq(54)
      expect(visitor1.spending_money).to eq("$10")

      # visitor1.add_preference(:gentle)

      # visitor1.add_preference(:thrilling)

      # visitor1.preferences
#=> [:gentle, :thrilling]

    end
  end
end