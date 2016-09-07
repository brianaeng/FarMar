require 'csv'

class FarMar::Vendor
  attr_accessor :products, :id, :name, :no_of_employees, :market_id

  def initialize(vendor_hash)
    @id = vendor_hash[:id]
    @name = vendor_hash[:name]
    @no_of_employees = vendor_hash[:no_of_employees]
    @market_id = vendor_hash[:market_id]
  end

  def self.make_vendors
    @vendors = []
    CSV.foreach("/Users/brianaeng/ada/week5/FarMar/support/vendors.csv") do |line|
      vendor_hash = FarMar::Vendor.new({id: line[0].to_i, name: line[1], no_of_employees: line[2].to_i, market_id: line[3].to_i})
      @vendors.push(vendor_hash)
    end
  end

  def self.all
    FarMar::Vendor.make_vendors
    return @vendors
  end

  def self.find(id)
    @vendors.each do |vendor|
      if vendor.id == id
        return vendor
      end
    end
  end

  def market
    all_markets = FarMar::Market.all
    all_markets.each do |market|
      if market.id == self.market_id
        return market
      end
    end
  end

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

  def revenue
    sales_array = self.sales
    total = 0

    sales_array.each do |sale|
      total += sale.amount
    end

    return total
  end

  def self.by_market(market_id)
    markets_array = FarMar::Market.all
    selected_market = markets_array[market_id - 1]

    selected_market.vendors
  end

end
