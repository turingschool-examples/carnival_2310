require 'rspec'
require_relative "./spec_helper"

describe Carnival do
    before(:all) do
        @carnival = Carnival.new
    end

    it "exists" do
        expect(@carnival).to be_a Carnival
    end
end