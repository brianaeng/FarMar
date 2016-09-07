require_relative '../far_mar'
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
end
