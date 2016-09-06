require_relative '../far_mar'
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
    return @products
  end

  def self.find(id)
    @products.each do |product|
      if product.id == id
        return product
      end
    end
  end
end
