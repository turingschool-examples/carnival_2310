require 'spec_helper'

RSpec.describe Visitor do

  it 'exists' do
    visitor1 = Visitor.new('Bruce', 54, '$10')

    expect(visitor1).to be_a(Visitor)
    expect(visitor1.name).to eq("Bruce")
    expect(visitor1.height).to eq(54)
    expect(visitor1.spending_money).to eq(10)
    expect(visitor1.preferences).to eq([])
  end

  it 'can add preferences' do
    visitor1.add_preference(:gentle)
    visitor1.add_preference(:thrilling)

    expect(visitor1.preferences).to eq([:gentle, :thrilling])
  end

  # it 'can determine if visitor is tall enough' do

  # end

end