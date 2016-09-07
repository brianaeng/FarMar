require_relative 'spec_helper'
require_relative '../far_mar'

describe 'FarMar::Product methods' do

  it 'must return an array of Product instances when self.all is called' do
    testing1 = FarMar::Product.all

    expect(testing1.class).must_equal(Array)
    expect(testing1[0].class).must_equal(FarMar::Product)
  end

  it 'must return a specific Vendor instance when an id is passed through self.find(id)' do
    FarMar::Product.all
    testing2 = FarMar::Product.find(496)

    expect(testing2.class).must_equal(FarMar::Product)
    expect(testing2.id).must_equal(496)
  end

  it 'must return one specific FarMar::Vendor instance when vendor is called' do
    testing3 = FarMar::Product.all
    found_vendor = testing3[5].vendor

    expect(found_vendor.class).must_equal(FarMar::Vendor)
    expect(found_vendor.id).must_equal(testing3[5].vendor_id)
  end

  it 'must return an array of FarMar::Sale instances when sales is called' do
    testing4 = FarMar::Product.all
    found_sales = testing4[3].sales

    expect(found_sales.class).must_equal(Array)
    expect(found_sales[0].product_id).must_equal(testing4[3].id)
    expect(found_sales[0].class).must_equal(FarMar::Sale)
  end

  it 'must return a fixnum when number_of_sales is called' do
    testing5 = FarMar::Product.all

    expect(testing5[100].number_of_sales.class).must_equal(Fixnum)
  end

  it 'must return an array of specific FarMar::Product instances when self.by_vendor(vendor_id) is called' do
    FarMar::Product.all
    testing6 = FarMar::Product.by_vendor(25)

    expect(testing6[0].vendor_id).must_equal(25)
    expect(testing6.class).must_equal(Array)
    expect(testing6[0].class).must_equal(FarMar::Product)
  end

end
