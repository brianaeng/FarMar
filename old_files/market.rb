class FarMar::Market
  attr_accessor :markets, :id, :name, :address, :city, :county, :state, :zip

  #Initializes FarMar::Market object with id, name, address, city, county, state, and zip
  def initialize(market_hash)
    @id = market_hash[:id]
    @name = market_hash[:name]
    @address = market_hash[:address]
    @city = market_hash[:city]
    @county = market_hash[:county]
    @state = market_hash[:state]
    @zip = market_hash[:zip]
  end

  #Class method to make an array of FarMar::Market objects from the information in markets.csv
  def self.make_markets
    @markets = []
    CSV.foreach("/Users/brianaeng/ada/week5/FarMar/support/markets.csv") do |line|
      market_hash = FarMar::Market.new({id: line[0].to_i, name: line[1], address: line[2], city: line[3], county: line[4], state: line[5], zip: line[6]})
      @markets.push(market_hash)
    end
  end

  #Class method to make and return the array of FarMar::Market objects from the information in markets.csv
  def self.all
    FarMar::Market.make_markets
    return @markets
  end

  #Class method to return a specific FarMar::Market object with a given id
  def self.find(id)
    markets = FarMar::Market.all
    markets.each do |market|
      if market.id == id
        return market
      end
    end
  end

  #Instance method to return an array of FarMar::Vendor objects linked to the FarMar::Market object
  def vendors
    collection = []

    all_vendors = FarMar::Vendor.all
    all_vendors.each do |vendor|
      if vendor.market_id == self.id
        collection.push(vendor)
      end
    end

    return collection
  end

end

# #Another way to do the vendors method
# CSV.foreach("/Users/brianaeng/ada/week5/FarMar/support/vendors.csv") do |line|
#   if line[3].to_i == self.id
#     hash = FarMar::Vendor.new({id: line[0].to_i, name: line[1], no_of_employees: line[2].to_i, market_id: line[3].to_i})
#     collection.push(hash)
#   end
# end
