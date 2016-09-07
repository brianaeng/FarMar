require_relative 'spec_helper'
require_relative '../lib/market'

describe 'FarMar::Market class methods' do
  before do
    FarMar::Market.make_markets
  end

  it 'must return an array of Market instances when self.all is called' do
    expect(FarMar::Market.all.class).must_equal(Array)
  end

  it 'must return a Market instance when an id is passed through self.find(id)' do
    expect(FarMar::Market.find(9).class).must_equal(FarMar::Market)
  end
end
