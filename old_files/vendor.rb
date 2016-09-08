class FarMar::Vendor
  attr_accessor :products, :id, :name, :no_of_employees, :market_id

  #Initializes FarMar::Vendor object with id, name, # of employees, and market id
  def initialize(vendor_hash)
    @id = vendor_hash[:id]
    @name = vendor_hash[:name]
    @no_of_employees = vendor_hash[:no_of_employees]
    @market_id = vendor_hash[:market_id]
  end

  #Class method to make an array of FarMar::Vendor objects from the information in vendors.csv
  def self.make_vendors
    @vendors = []
    CSV.foreach("/Users/brianaeng/ada/week5/FarMar/support/vendors.csv") do |line|
      vendor_hash = FarMar::Vendor.new({id: line[0].to_i, name: line[1], no_of_employees: line[2].to_i, market_id: line[3].to_i})
      @vendors.push(vendor_hash)
    end
  end

  #Class method to make and return the array of FarMar::Vendor objects from the information in vendors.csv
  def self.all
    FarMar::Vendor.make_vendors
    return @vendors
  end

  #Class method to return a specific FarMar::Vendor object with a given id
  def self.find(id)
    FarMar::Vendor.make_vendors
    @vendors.each do |vendor|
      if vendor.id == id
        return vendor
      end
    end
  end

  #Instance method to return a specific FarMar::Market object linked to the FarMar::Vendor object
  def market
    all_markets = FarMar::Market.all
    all_markets.each do |market|
      if market.id == self.market_id
        return market
      end
    end
  end

  #Instance method to return an array of FarMar::Product objects linked to the FarMar::Vendor object
  def products
    collection = []

    all_products = FarMar::Product.all
    all_products.each do |product|
      if product.vendor_id == self.id
        collection.push(product)
      end
    end

    return collection
  end

  #Instance method to return an array of FarMar::Sale objects linked to the FarMar::Vendor object
  def sales
    collection = []

    all_sales = FarMar::Sale.all
    all_sales.each do |sale|
      if sale.vendor_id == self.id
        collection.push(sale)
      end
    end

    return collection
  end

  #Instance method to calculate and return the total revenue for the FarMar::Vendor object
  def revenue
    sales_array = self.sales
    total = 0

    sales_array.each do |sale|
      total += sale.amount
    end

    return total
  end

  #Class method to return an array of FarMar::Vendor objects with the given market_id
  def self.by_market(market_id)
    collection = []

    vendors_array = self.all
    vendors_array.each do |vendor|
      if vendor.market_id == market_id
        collection.push(vendor)
      end
    end

    return collection
  end

end

# #Another version of the self.by_market(market_id) method. This one seems less efficient because it creates all the FarMar::Market objects AND all the FarMar::Vendor objects (with the vendors method)
# markets_array = FarMar::Market.all
# selected_market = markets_array[market_id - 1]
#
# selected_market.vendors
