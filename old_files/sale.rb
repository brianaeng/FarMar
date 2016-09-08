class FarMar::Sale
  attr_accessor :products, :id, :amount, :purchase_time, :vendor_id, :product_id

  #Initializes FarMar::Sale object with id, amount, purchase time, vendor id, and product id
  def initialize(sale_hash)
    @id = sale_hash[:id]
    @amount = sale_hash[:amount]
    @purchase_time = sale_hash[:purchase_time]
    @vendor_id = sale_hash[:vendor_id]
    @product_id = sale_hash[:product_id]
  end

  #Class method to make an array of FarMar::Sale objects from the information in sales.csv
  def self.make_sales
    @sales = []
    CSV.foreach("/Users/brianaeng/ada/week5/FarMar/support/sales.csv") do |line|
      time = DateTime.parse(line[2])
      sale_hash = FarMar::Sale.new({id: line[0].to_i, amount: line[1].to_i, purchase_time: time, vendor_id: line[3].to_i, product_id: line[4].to_i})
      @sales.push(sale_hash)
    end
  end

  #Class method to make and return the array of FarMar::Sale objects from the information in sales.csv
  def self.all
    FarMar::Sale.make_sales
    return @sales
  end

  #Class method to return a specific FarMar::Sale object with a given id
  def self.find(id)
    FarMar::Sale.make_sales
    @sales.each do |sale|
      if sale.id == id
        return sale
      end
    end
  end

  #Instance method to return a specific FarMar::Vendor object linked to the FarMar::Sale object
  def vendor
    all_vendors = FarMar::Vendor.all
    all_vendors.each do |vendor|
      if vendor.id == self.vendor_id
        return vendor
      end
    end
  end

  #Instance method to return a specific FarMar::Product object linked to the FarMar::Sale object
  def product
    all_products = FarMar::Product.all
    all_products.each do |product|
      if product.id == self.product_id
        return product
      end
    end
  end

  #Class method to return an array of FarMar::Sale objects with a purchase time within beginning_time and end_time
  def self.between(beginning_time, end_time)
    collection = []
    start_time = DateTime.parse(beginning_time)
    end_time = DateTime.parse(end_time)

    all_sales = FarMar::Sale.all
    all_sales.each do |sale|
      # if start_time < sale.purchase_time < end_time
      #   collection.push(sale)
      # end
      if sale.purchase_time.between?(start_time, end_time)
        collection.push(sale)
      end
    end

    return collection
  end

end
