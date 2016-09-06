require_relative 'spec_helper'
require_relative '../lib/vendor'

describe 'vendor class methods' do
  it 'must return all the instances in the collection when self.all is called' do
    FarMar::Vendor.make_vendors
    expect(FarMar::Vendor.all.length).must_equal(2690)
  end

  it 'must return the instance of a specific object when an id is passed through self.find(id)' do
    FarMar::Vendor.make_vendors
    expect(FarMar::Vendor.find(2643).no_of_employees).must_equal(4)
  end
end
