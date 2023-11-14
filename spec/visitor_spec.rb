require './lib/visitor'


RSpec.describe Visitor do
  before(:each) do
    @visitor1 = Visitor.new('Bruce', 54, '$10')
  end

  describe '#initialize' do
    it 'exists' do
      expect(@visitor1).to be_a(Visitor)
    end
  end

  describe 'attributes' do
    it 'reads attributes and returns them' do
      expect(@visitor1.name).to eq("Bruce")
      expect(@visitor1.height).to eq(54)
      expect(@visitor1.height).to eq(10)
      expect(@visitor1.preferences).to eq([])
    end
  end
end