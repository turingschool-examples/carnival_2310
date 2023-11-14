require 'spec_helper'

RSpec.describe Carnival do

  it 'exists' do
    carnival = Carnival.new(14)

    expect(carnival).to be_a(Carnival)
    expect(carnival.duration).to eq(14)
    expect(carnival.rides).to eq([])
  end

  xit 'can add rides' do

  end

end