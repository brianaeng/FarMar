require_relative '../far_mar'
require 'csv'

class FarMar::Product
  def self.make_products
    @products = []
    CSV.foreach("/Users/brianaeng/ada/week5/FarMar/support/products.csv") do |line|
      product_hash = {id: line[0].to_i, name: line[1], vendor_id: line[2].to_i}
      @products.push(product_hash)
    end
  end

  def self.all
    return @products
  end

  def self.find(id)
    @products.each do |product|
      if product[:id] == id
        return product
      end
    end
  end
end
