require_relative 'spec_helper'
require_relative '../far_mar'

describe 'FarMar::Product methods' do

  let(:product1) {FarMar::Product.all}
  let(:product2) {FarMar::Product.find(496)}
  let(:product3) {FarMar::Product.by_vendor(25)}

  it 'must return an array of Product instances when self.all is called' do
    expect(product1.class).must_equal(Array)
    expect(product1[0].class).must_equal(FarMar::Product)
  end

  it 'must return a specific Vendor instance when an id is passed through self.find(id)' do
    expect(product2.class).must_equal(FarMar::Product)
    expect(product2.id).must_equal(496)
    expect(product2.name).must_equal("Splendid Fruit")
  end

  it 'must return one specific FarMar::Vendor instance when vendor is called' do
    found_vendor = product1[5].vendor

    expect(found_vendor.class).must_equal(FarMar::Vendor)
    expect(found_vendor.id).must_equal(product1[5].vendor_id)
    expect(found_vendor.name).must_equal("Kris and Sons")
  end

  it 'must return an array of FarMar::Sale instances when sales is called' do
    found_sales = product1[3].sales

    expect(found_sales.class).must_equal(Array)
    expect(found_sales[0].product_id).must_equal(product1[3].id)
    expect(found_sales[0].class).must_equal(FarMar::Sale)
  end

  it 'must return a fixnum when number_of_sales is called' do
    expect(product1[100].number_of_sales.class).must_equal(Fixnum)
    expect(product1[100].number_of_sales).must_equal(3)
  end

  it 'must return an array of specific FarMar::Product instances when self.by_vendor(vendor_id) is called' do
    expect(product3[0].vendor_id).must_equal(25)
    expect(product3.class).must_equal(Array)
    expect(product3[0].class).must_equal(FarMar::Product)
  end

end
