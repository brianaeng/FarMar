class FarMar::Market
  attr_accessor :id, :name, :address, :city, :county, :state, :zip

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

  #Class method to make and return the array of FarMar::Market objects from the information in markets.csv
  def self.all
    markets = []

    CSV.foreach("/Users/brianaeng/ada/week5/FarMar/support/markets.csv") do |line|
      market_hash = FarMar::Market.new({id: line[0].to_i, name: line[1], address: line[2], city: line[3], county: line[4], state: line[5], zip: line[6]})
      markets.push(market_hash)
    end

    return markets
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
    FarMar::Vendor.by_market(self.id)
  end

  def products #No clue if this is right
    vendors_array = self.vendors
    vendors_id = vendors_array[0].id

    FarMar::Product.by_vendor(vendors_id)
  end

end

#products returns a collection of FarMar::Product instances that are associated to the market through the FarMar::Vendor class.
#self.search(search_term) returns a collection of FarMar::Market instances where the market name or vendor name contain the search_term. For example FarMar::Market.search('school') would return 3 results, one being the market with id 75 (Fox School Farmers FarMar::Market).
#prefered_vendor: returns the vendor with the highest revenue
#prefered_vendor(date): returns the vendor with the highest revenue for the given date
#worst_vendor: returns the vendor with the lowest revenue
#worst_vendor(date): returns the vendor with the lowest revenue on the given date
