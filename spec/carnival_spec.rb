require 'spec_helper'
require 'rspec'

RSpec.describe Carnival do
  it "exists" do
    carnival_1 = Carnival.new
    expect(carnival_1).to be_a Carnival
  end

  it "has a method that tells carnival duration" do
    carnival_1 = Carnival.new
    expect(carnival_1.duration).to eq(14)
  end

  it "can add rides" do
    carnival_1 = Carnival.new
    expect(carnival_1.rides).to eq([])
  end

  it "has most popular ride method" do

  end

  

end