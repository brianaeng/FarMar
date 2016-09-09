class FarMar::Vendor
  attr_accessor :id, :name, :no_of_employees, :market_id

  #Initializes FarMar::Vendor object with id, name, # of employees, and market id
  def initialize(vendor_hash)
    @id = vendor_hash[:id]
    @name = vendor_hash[:name]
    @no_of_employees = vendor_hash[:no_of_employees]
    @market_id = vendor_hash[:market_id]
  end

  #Class method to make and return the array of FarMar::Vendor objects from the information in vendors.csv
  def self.all
    vendors = []
    CSV.foreach("/Users/brianaeng/ada/week5/FarMar/support/vendors.csv") do |line|
      vendor_hash = FarMar::Vendor.new({id: line[0].to_i, name: line[1], no_of_employees: line[2].to_i, market_id: line[3].to_i})
      vendors.push(vendor_hash)
    end

    return vendors
  end

  #Class method to return a specific FarMar::Vendor object with a given id
  def self.find(id)
    vendors = FarMar::Vendor.all
    vendors.each do |vendor|
      if vendor.id == id
        return vendor
      end
    end
  end

  #Instance method to return a specific FarMar::Market object linked to the FarMar::Vendor object
  def market
    FarMar::Market.find(self.market_id)
  end

  #Instance method to return an array of FarMar::Product objects linked to the FarMar::Vendor object
  def products
    FarMar::Product.by_vendor(self.id)
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

  #Class method to return the top n FarMar::Vendor instances ranked by total revenue
  def self.most_revenue(n)
    all_vendors = self.all

    collection = []

    all_vendors.each do |vendor|
      total_revenue = vendor.revenue
      vendor_instance = {vendor: vendor, revenue: total_revenue}
      collection.push(vendor_instance)
    end

    new_collection = collection.sort_by { |hash| hash[:revenue] }.reverse

    counter = 0
    instances = []

    n.times do
      instances.push(new_collection[counter][:vendor])
      counter += 1
    end

    return instances
  end

end

# #To do:
# self.most_items(n) returns the top n vendor instances ranked by total number of items sold
# self.revenue(date) returns the total revenue for that date across all vendors
#revenue(date) returns the total revenue for that specific purchase date and vendor instance
