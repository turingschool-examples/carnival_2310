require './lib/visitor'

RSpec.describe Visitor do
  describe '#initialize' do
    it 'creates a new visitor with specified attributes' do
      visitor = Visitor.new('Bruce', 54, '$10')

      expect(visitor.name).to eq('Bruce')
      expect(visitor.height).to eq(54)
      expect(visitor.spending_money).to eq(10)
      expect(visitor.preferences).to eq([])
    end
  end

  describe 'add_preference' do
    it 'adds preferences to visitors' do
      visitor = Visitor.new('Bruce', 54, '$10')
      visitor.add_preference(:gentle)
      visitor.add_preference(:thrilling)

      expect(visitor.preferences).to contain_exactly(:gentle, :thrilling)
    end
  end




end

