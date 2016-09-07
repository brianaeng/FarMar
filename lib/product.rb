require 'csv'

class FarMar::Product
  attr_accessor :products, :id, :name, :vendor_id

  def initialize(product_hash)
    @id = product_hash[:id]
    @name = product_hash[:name]
    @vendor_id = product_hash[:vendor_id]
  end

  def self.make_products
    @products = []
    CSV.foreach("/Users/brianaeng/ada/week5/FarMar/support/products.csv") do |line|
      product_hash = FarMar::Product.new({id: line[0].to_i, name: line[1], vendor_id: line[2].to_i})
      @products.push(product_hash)
    end
  end

  def self.all
    FarMar::Product.make_products
    return @products
  end

  def self.find(id)
    @products.each do |product|
      if product.id == id
        return product
      end
    end
  end

  def vendor
    all_vendors = FarMar::Vendor.all
    all_vendors.each do |vendor|
      if vendor.id == self.vendor_id
        return vendor
      end
    end
  end

end

#sales: returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.
#number_of_sales: returns the number of times this product has been sold.
#self.by_vendor(vendor_id): returns all of the products with the given vendor_id
