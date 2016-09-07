require_relative 'spec_helper'
require_relative '../far_mar'

describe 'FarMar::Sale methods' do
  before do
    FarMar::Sale.make_sales
  end

  it 'must return an array of Sale instances when self.all is called' do
    expect(FarMar::Sale.all.class).must_equal(Array)
  end

  it 'must return a Sale instance when an id is passed through self.find(id)' do
    expect(FarMar::Sale.find(13).class).must_equal(FarMar::Sale)
  end

end
