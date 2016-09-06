require_relative 'spec_helper'
require_relative '../lib/product'

describe 'product class methods' do
  it 'must return all the instances in the collection when self.all is called' do
    FarMar::Product.make_products
    expect(FarMar::Product.all.length).must_equal(8193)
  end

  it 'must return the instance of a specific object when an id is passed through self.find(id)' do
    FarMar::Product.make_products
    expect(FarMar::Product.find(1).name).must_equal("Dry Beets")
  end
end
