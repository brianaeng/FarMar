require_relative 'spec_helper'
require_relative '../far_mar'

describe 'FarMar::Vendor methods' do

  it 'must return an array of Vendor instances when self.all is called' do
    testing1 = FarMar::Vendor.all

    expect(testing1.class).must_equal(Array)
    expect(testing1[0].class).must_equal(FarMar::Vendor)
  end

  it 'must return a specific Vendor instance when an id is passed through self.find(id)' do
    FarMar::Vendor.all
    testing2 = FarMar::Vendor.find(167)

    expect(testing2.class).must_equal(FarMar::Vendor)
    expect(testing2.id).must_equal(167)
  end

  it 'must return one FarMar::Market instance when market is called' do
    testing3 = FarMar::Vendor.all
    found_market = testing3[7].market

    expect(found_market.class).must_equal(FarMar::Market)
    expect(found_market.id).must_equal(testing3[7].market_id)
  end

  it 'must return an array of specific FarMar::Product instances when products is called' do
    testing4 = FarMar::Vendor.all
    found_products = testing4[0].products

    expect(found_products.class).must_equal(Array)
    expect(found_products[0].vendor_id).must_equal(testing4[0].id)
    expect(found_products[0].class).must_equal(FarMar::Product)
  end

  it 'must return an array of specific FarMar::Sale instances when sales is called' do
    testing5 = FarMar::Vendor.all
    found_sales = testing5[1].sales

    expect(found_sales.class).must_equal(Array)
    expect(found_sales[0].vendor_id).must_equal(testing5[1].id)
    expect(found_sales[0].class).must_equal(FarMar::Sale)
  end

  it 'must return an integer when revenue is called' do
    testing6 = FarMar::Vendor.all

    expect(testing6[5].revenue.class).must_equal(Fixnum)
  end

  it 'must return an array of specific FarMar::Vendor instances when self.by_market(market_id) is called' do
    FarMar::Vendor.all
    testing7 = FarMar::Vendor.by_market(7)

    expect(testing7[0].market_id).must_equal(7)
    expect(testing7.class).must_equal(Array)
    expect(testing7[0].class).must_equal(FarMar::Vendor)
  end

end
