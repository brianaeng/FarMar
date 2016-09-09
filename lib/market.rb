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

  #Instance method to return a collection of FarMar::Product instances associated to the given market through the associated FarMar::Vendor instance(s)
  def products
    collection = []
    vendors_array = self.vendors

    vendors_array.each do |vendor|
      collection += FarMar::Product.by_vendor(vendor.id)
    end

    return collection
  end

  #Class method to return a collection of FarMar::Market objects associated with markets or vendors that contain the given search_term
  def self.search(search_term)
    search_term.downcase!

    markets = FarMar::Market.all
    vendors = FarMar::Vendor.all
    collection = []

    markets.each do |market|
      if (market.name.downcase).include? search_term
        collection.push(market)
      end
    end

    vendors.each do |vendor|
      if (vendor.name.downcase).include? search_term
        collection.push(vendor.market)
      end
    end

    return collection

  end

  #Instance method to return the vendor with the highest revenue associated with the FarMar::Market object
  def prefered_vendor
    vendors_array = vendors

    highest_revenue = 0
    best_vendor = nil

    vendors_array.each do |vendor|
      vendor_revenue = vendor.revenue
      if vendor_revenue > highest_revenue
        highest_revenue = vendor_revenue
        best_vendor = vendor
      end
    end

    return best_vendor
  end

  # #Instance method to return the vendor with the lowest revenue associated with the FarMar::Market object
  def worst_vendor
    vendors_array = vendors

    lowest_revenue = 10000000
    bad_vendor = nil

    vendors_array.each do |vendor|
      vendor_revenue = vendor.revenue
      if vendor_revenue < lowest_revenue
        lowest_revenue = vendor_revenue
        bad_vendor = vendor
      end
    end

    return bad_vendor

  end

end

# #To do:
#prefered_vendor(date): returns the vendor with the highest revenue for the given date
#worst_vendor(date): returns the vendor with the lowest revenue on the given date
