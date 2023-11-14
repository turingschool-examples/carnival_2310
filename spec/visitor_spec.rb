require 'spec_helper'

describe Visitor do
  it describe "initialize" do
    visitor1 = Visitor.new('Bruce', 54, '$10')
    expect(visitor1).to be_instance_of(Vistor)
  end


  
end