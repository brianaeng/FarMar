require_relative 'spec_helper'
require_relative '../lib/product'

describe 'FarMar::Product class methods' do
  before do
    FarMar::Product.make_products
  end

  it 'must return an array of Product instances when self.all is called' do
    expect(FarMar::Product.all.class).must_equal(Array)
  end

  it 'must return a Product instance when an id is passed through self.find(id)' do
    expect(FarMar::Product.find(1).class).must_equal(FarMar::Product)
  end

end
