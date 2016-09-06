require_relative 'spec_helper'
require_relative '../lib/sale'

describe 'sale class methods' do
  it 'must return all the instances in the collection when self.all is called' do
    FarMar::Sale.make_sales
    expect(FarMar::Sale.all.length).must_equal(12798)
  end

  it 'must return the instance of a specific object when an id is passed through self.find(id)' do
    FarMar::Sale.make_sales
    expect(FarMar::Sale.find(13).amount).must_equal(3450)
  end
end
