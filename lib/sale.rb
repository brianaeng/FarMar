class FarMar::Sale
  attr_accessor :id, :amount, :purchase_time, :vendor_id, :product_id

  #Initializes FarMar::Sale object with id, amount, purchase time, vendor id, and product id
  def initialize(sale_hash)
    @id = sale_hash[:id]
    @amount = sale_hash[:amount]
    @purchase_time = sale_hash[:purchase_time]
    @vendor_id = sale_hash[:vendor_id]
    @product_id = sale_hash[:product_id]
  end

  #Class method to make and return the array of FarMar::Sale objects from the information in sales.csv
  def self.all
    sales = []

    CSV.foreach("/Users/brianaeng/ada/week5/FarMar/support/sales.csv") do |line|
      # time = DateTime.strptime(line[2], "%Y-%m-%d %H:%M:%S %z")
      time = DateTime.parse(line[2])
      sale_hash = FarMar::Sale.new({id: line[0].to_i, amount: line[1].to_i, purchase_time: time, vendor_id: line[3].to_i, product_id: line[4].to_i})
      sales.push(sale_hash)
    end

    return sales
  end

  #Class method to return a specific FarMar::Sale object with a given id
  def self.find(id)
    sales = FarMar::Sale.all
    sales.each do |sale|
      if sale.id == id
        return sale
      end
    end
  end

  #Instance method to return a specific FarMar::Vendor object linked to the FarMar::Sale object
  def vendor
    FarMar::Vendor.find(self.vendor_id)
  end

  #Instance method to return a specific FarMar::Product object linked to the FarMar::Sale object
  def product
    FarMar::Product.find(self.product_id)
  end

  #Class method to return an array of FarMar::Sale objects with a purchase time within beginning_time and end_time
  def self.between(beginning_time, end_time)
    collection = []
    start_time = DateTime.parse(beginning_time)
    end_time = DateTime.parse(end_time)

    all_sales = FarMar::Sale.all
    all_sales.each do |sale|
      if sale.purchase_time.between?(start_time, end_time)
        collection.push(sale)
      end
    end

    return collection
  end

end
