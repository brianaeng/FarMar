class FarMar::Product
  attr_accessor :products, :id, :name, :vendor_id

  #Initializes FarMar::Product object with id, name, and vendor id
  def initialize(product_hash)
    @id = product_hash[:id]
    @name = product_hash[:name]
    @vendor_id = product_hash[:vendor_id]
  end

  #Class method to make an array of FarMar::Product objects from the information in products.csv
  def self.make_products
    @products = []
    CSV.foreach("/Users/brianaeng/ada/week5/FarMar/support/products.csv") do |line|
      product_hash = FarMar::Product.new({id: line[0].to_i, name: line[1], vendor_id: line[2].to_i})
      @products.push(product_hash)
    end
  end

  #Class method to make and return the array of FarMar::Product objects from the information in products.csv
  def self.all
    FarMar::Product.make_products
    return @products
  end

  #Class method to return a specific FarMar::Product object with a given id
  def self.find(id)
    FarMar::Product.make_products
    @products.each do |product|
      if product.id == id
        return product
      end
    end
  end

  #Instance method to return a specific FarMar::Vendor object linked to the FarMar::Product object
  def vendor
    all_vendors = FarMar::Vendor.all
    all_vendors.each do |vendor|
      if vendor.id == self.vendor_id
        return vendor
      end
    end
  end

  #Instance method to return an array of FarMar::Sales objects linked to the FarMar::Product object
  def sales
    collection = []

    all_sales = FarMar::Sale.all
    all_sales.each do |sale|
      if sale.product_id == self.id
        collection.push(sale)
      end
    end

    return collection
  end

  #Instance method to calculate and return the total # of sales for the FarMar::Product object
  def number_of_sales
    total_sales = self.sales
    return total_sales.length
  end

  #Class method to return an array of FarMar::Product objects with the given vendor_id
  def self.by_vendor(vendor_id)
    collection = []

    products_array = self.all
    products_array.each do |product|
      if product.vendor_id == vendor_id
        collection.push(product)
      end
    end

    return collection
  end

end

# #Another version of the self.by_vendor(vendor_id) method. This one seems less efficient because it creates all the FarMar::Vendor objects AND all the FarMar::Product objects (with the products method)
# vendor_array = FarMar::Vendor.all
# selected_vendors = vendor_array[vendor_id - 1]
#
# selected_vendors.products
