require_relative 'spec_helper'
require_relative '../far_mar'

describe 'FarMar::Sale methods' do

  let(:sale1) {FarMar::Sale.all}
  let(:sale2) {FarMar::Sale.find(10858)}
  let(:sale3) {FarMar::Sale.between('2013-11-08 04:31:41 -0800', '2013-11-08 05:19:05 -0800')}

  it 'must return an array of Sale instances when self.all is called' do
    expect(sale1.class).must_equal(Array)
    expect(sale1[0].class).must_equal(FarMar::Sale)
  end

  it 'must return a specific Sale instance when an id is passed through self.find(id)' do
    expect(sale2.class).must_equal(FarMar::Sale)
    expect(sale2.id).must_equal(10858)
    expect(sale2.amount).must_equal(9399)
  end

  it 'must return one specific FarMar::Vendor instance when vendor is called' do
    found_vendor = sale1[21].vendor

    expect(found_vendor.class).must_equal(FarMar::Vendor)
    expect(found_vendor.id).must_equal(sale1[21].vendor_id)
  end

  it 'must return one specific FarMar::Product instance when product is called' do
    found_product = sale1[86].product

    expect(found_product.class).must_equal(FarMar::Product)
    expect(found_product.id).must_equal(sale1[86].product_id)
  end

  it 'must return an array of FarMar::Sale instances between a specific time' do
    expect(sale3.class).must_equal(Array)
    expect(sale3[0].class).must_equal(FarMar::Sale)
  end
end
