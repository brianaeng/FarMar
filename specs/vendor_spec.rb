require_relative 'spec_helper'
require_relative '../far_mar'

describe 'FarMar::Vendor methods' do

  let(:vendor1) {FarMar::Vendor.all}
  let(:vendor2) {FarMar::Vendor.find(167)}
  let(:vendor3) {FarMar::Vendor.by_market(7)}


  it 'must return an array of Vendor instances when self.all is called' do
    expect(vendor1.class).must_equal(Array)
    expect(vendor1[0].class).must_equal(FarMar::Vendor)
  end

  it 'must return a specific Vendor instance when an id is passed through self.find(id)' do
    expect(vendor2.class).must_equal(FarMar::Vendor)
    expect(vendor2.id).must_equal(167)
    expect(vendor2.name).must_equal("Stanton, Strosin and Rogahn")
  end

  it 'must return one FarMar::Market instance when market is called' do
    found_market = vendor1[7].market

    expect(found_market.class).must_equal(FarMar::Market)
    expect(found_market.id).must_equal(vendor1[7].market_id)
  end

  it 'must return an array of specific FarMar::Product instances when products is called' do
    found_products = vendor1[0].products

    expect(found_products.class).must_equal(Array)
    expect(found_products[0].vendor_id).must_equal(vendor1[0].id)
    expect(found_products[0].class).must_equal(FarMar::Product)
  end

  it 'must return an array of specific FarMar::Sale instances when sales is called' do
    found_sales = vendor1[1].sales

    expect(found_sales.class).must_equal(Array)
    expect(found_sales[0].vendor_id).must_equal(vendor1[1].id)
    expect(found_sales[0].class).must_equal(FarMar::Sale)
  end

  it 'must return a fixnum when revenue is called' do
    expect(vendor1[5].revenue.class).must_equal(Fixnum)
    expect(vendor1[5].revenue).must_equal(2977)
  end

  it 'must return an array of specific FarMar::Vendor instances when self.by_market(market_id) is called' do
    expect(vendor3[0].market_id).must_equal(7)
    expect(vendor3.class).must_equal(Array)
    expect(vendor3[0].class).must_equal(FarMar::Vendor)
  end

  it 'must return an array of n top FarMar::Vendor instances ranked by total revenue' do
    found_vendors = FarMar::Vendor.most_revenue(34)

    expect(found_vendors[0].name).must_equal("Swaniawski-Schmeler")
    expect(found_vendors.class).must_equal(Array)
    expect(found_vendors[0].class).must_equal(FarMar::Vendor)
  end

end
