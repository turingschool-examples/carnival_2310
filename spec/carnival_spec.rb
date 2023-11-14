require 'spec_helper'


RSpec.describe Carnival do

  before(:each) do
    @carnival = Carnival.new('Winter Wonderland', 7)
  end

  it 'exists' do
    expect(@carnival).to be_an_instance_of(Carnival)
  end



end