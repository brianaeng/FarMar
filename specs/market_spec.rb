require_relative 'spec_helper'
require_relative '../lib/market'

describe 'market class methods' do
  it 'must return all the instances in the collection when self.all is called' do
    FarMar::Market.make_market
    expect(FarMar::Market.all.length).must_equal(500)
  end

  it 'must return the instance of a specific object when an id is passed through self.find(id)' do
    FarMar::Market.make_market
    expect(FarMar::Market.find(9)).must_equal({
         :id => "9",
       :name => "Farmers Market at Christopher Newport University",
    :address => "1 Avenue of the Arts",
       :city => "Newport News",
     :county => "Newport News",
      :state => "Virginia",
        :zip => "23606"
    })
  end
end
