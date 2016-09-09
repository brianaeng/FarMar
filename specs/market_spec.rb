require_relative 'spec_helper'
require_relative '../far_mar'

describe 'FarMar::Market methods' do

  let(:market1) {FarMar::Market.all}
  let(:market2) {FarMar::Market.find(9)}
  let(:market3) {FarMar::Market.search("school")}

  it 'must return an array of Market instances when self.all is called' do
    expect(market1.class).must_equal(Array)
    expect(market1[0].class).must_equal(FarMar::Market)
    expect(market1[5].name).must_equal("Jefferson City Farmer's Market")
  end

  it 'must return a specific Market instance when an id is passed through self.find(id)' do
    expect(market2.class).must_equal(FarMar::Market)
    expect(market2.id).must_equal(9)
    expect(market2.name).must_equal("Farmers Market at Christopher Newport University")
  end

  it 'must return an array of FarMar::Vendor instances when vendors is called' do
    expect(market1[0].vendors.class).must_equal(Array)
    expect(market1[0].vendors[0].class).must_equal(FarMar::Vendor)
    expect(market1[0].vendors[0].market_id).must_equal(market1[0].id)
  end

  it 'must return an array of specific FarMar::Product instances when products is called' do
    expect(market1[0].products.class).must_equal(Array)
    expect(market1[0].products[0].class).must_equal(FarMar::Product)
    expect(market1[0].products[0].name).must_equal("Dry Beets")
  end

  it 'must return an array of FarMar::Market instances with the given search term when self.search(search_term is called)' do
    expect(market3.class).must_equal(Array)
    expect(market3[0].class).must_equal(FarMar::Market)
    expect(market3[0].name).must_equal("Fox School Farmers Market")
  end

  it 'must return the FarMar::Vendor object with the highest revenue for a specific Far::Mar market when prefered_vendor is called' do
    expect(market1[2].prefered_vendor.class).must_equal(FarMar::Vendor)
    expect(market1[2].prefered_vendor.name).must_equal("Kertzmann LLC")
  end

  it 'must return the FarMar::Vendor object with the lowest revenue for a specific Far::Mar market when worst_vendor is called' do
    expect(market1[2].worst_vendor.class).must_equal(FarMar::Vendor)
    expect(market1[2].worst_vendor.name).must_equal("Windler Inc")
  end

end
