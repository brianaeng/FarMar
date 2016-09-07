require_relative 'spec_helper'
require_relative '../lib/vendor'

describe 'FarMar::Vendor class methods' do
  before do
    FarMar::Vendor.make_vendors
  end

  it 'must return an array of Vendor instances when self.all is called' do
    expect(FarMar::Vendor.all.class).must_equal(Array)
  end

  it 'must return a Vendor instance when an id is passed through self.find(id)' do
    expect(FarMar::Vendor.find(2643).class).must_equal(FarMar::Vendor)
  end

end
