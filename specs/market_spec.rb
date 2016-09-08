require_relative 'spec_helper'
require_relative '../far_mar'

describe 'FarMar::Market methods' do

  it 'must return an array of Market instances when self.all is called' do
    testing1 = FarMar::Market.all

    expect(testing1.class).must_equal(Array)
    expect(testing1[0].class).must_equal(FarMar::Market)
    expect(testing1[5].name).must_equal("Jefferson City Farmer's Market")
  end

  it 'must return a specific Market instance when an id is passed through self.find(id)' do
    testing2 = FarMar::Market.find(9)

    expect(testing2.class).must_equal(FarMar::Market)
    expect(testing2.id).must_equal(9)
    expect(testing2.name).must_equal("Farmers Market at Christopher Newport University")
  end

  it 'must return an Array of FarMar::Vendor instances when vendors is called' do
    testing3 = FarMar::Market.all

    expect(testing3[0].vendors.class).must_equal(Array)
    expect(testing3[0].vendors[0].class).must_equal(FarMar::Vendor)
    expect(testing3[0].vendors[0].market_id).must_equal(testing3[0].id)
  end
end
