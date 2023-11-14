require 'spec_helper'


RSpec.describe Visitor do

  before(:each) do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
  end

  it 'exists' do
    expect(@visitor1).to be_an_instance_of(Visitor)
  end

  it 'has attributes' do
    expect(@visitor1.name).to eq('Bruce')
    expect(@visitor1.height).to eq(54)
    expect(@visitor1.spending_money).to eq('$10')
    expect(@visitor1.preferences).to eq([])
  end

  it 'can add to the array of preferences' do
    @visitor1.add_preference(:gentle)
    @visitor1.add_preference(:thrilling)

    expect(@visitor1.preferences).to eq([:gentle, :thrilling])
  end

  it 'can determine if the visitor is tall enough based on threshholds' do
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')

    expect(@visitor1.tall_enough?(54)).to eq(true)
    expect(@visitor2.tall_enough?(54)).to eq(false)
    expect(@visitor3.tall_enough?(54)).to eq(true)
    expect(@visitor1.tall_enough?(64)).to eq(false)
  end

end