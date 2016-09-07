require_relative 'spec_helper'
require_relative '../far_mar'

describe 'FarMar::Sale methods' do

  it 'must return an array of Sale instances when self.all is called' do
    testing1 = FarMar::Sale.all

    expect(testing1.class).must_equal(Array)
    expect(testing1[0].class).must_equal(FarMar::Sale)
  end

  it 'must return a specific Sale instance when an id is passed through self.find(id)' do
    FarMar::Sale.all
    testing2 = FarMar::Sale.find(10858)

    expect(testing2.class).must_equal(FarMar::Sale)
    expect(testing2.id).must_equal(10858)
  end

  it 'must return one specific FarMar::Vendor instance when vendor is called' do
    testing3 = FarMar::Sale.all
    found_vendor = testing3[21].vendor

    expect(found_vendor.class).must_equal(FarMar::Vendor)
    expect(found_vendor.id).must_equal(testing3[21].vendor_id)
  end

  it 'must return one specific FarMar::Product instance when product is called' do
    testing4 = FarMar::Sale.all
    found_product = testing4[86].product

    expect(found_product.class).must_equal(FarMar::Product)
    expect(found_product.id).must_equal(testing4[86].product_id)
  end

  # it 'must return an array of FarMar::Sale instances between a specific time' do
  #   FarMar::Sale.all
  #   found_sales = FarMar::Sale.between(BEGINNING TIME, END TIME)
  #
  #   expect(found_sales.class).must_equal(Array)
  #   expect(found_sales[0].class).must_equal(FarMar::Sale)
  # end
end
