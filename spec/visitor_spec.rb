require 'rspec'
require_relative "./spec_helper"

describe Visitor do
    before(:all) do

        @visitor1 = Visitor.new("Bruce", 54, "$10")
        
    end
    
    it "exists" do
        expect(@visitor1).to be_a Visitor
    end

    it "accepts arguments for name, height, and spending_money, and instantiates an empty preferences array" do
        expect(@visitor1.name).to eq("Bruce")
        expect(@visitor1.height).to eq(54)
        expect(@visitor1.spending_money).to eq(10)
        expect(@visitor1.preferences).to eq([])
    end
end