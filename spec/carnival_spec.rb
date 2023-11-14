require 'rspec'
require_relative "./spec_helper"

describe Carnival do
    before(:all) do
        @carnival = Carnival.new(10)
    end

    it "exists" do
        expect(@carnival).to be_a Carnival
    end

    it "stores and reads a duration argument" do
        expect(@carnival.duration).to eq(10)
    end
end