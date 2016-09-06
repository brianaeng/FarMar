require_relative '../far_mar'
require 'csv'

class FarMar::Market
  attr_accessor :markets, :id, :name, :address, :city, :county, :state, :zip

  def initialize(market_hash)
    @id = market_hash[:id]
    @name = market_hash[:name]
    @address = market_hash[:address]
    @city = market_hash[:city]
    @county = market_hash[:county]
    @state = market_hash[:state]
    @zip = market_hash[:zip]
  end

  def self.make_markets
    @markets = []
    CSV.foreach("/Users/brianaeng/ada/week5/FarMar/support/markets.csv") do |line|
      market_hash = FarMar::Market.new({id: line[0].to_i, name: line[1], address: line[2], city: line[3], county: line[4], state: line[5], zip: line[6]})
      @markets.push(market_hash)
    end
  end

  def self.all
    return @markets
  end

  def self.find(id)
    @markets.each do |market|
      if market.id == id
        return market
      end
    end
  end

  # def vendors
  #   id = self[:id]
  #   collection = []
  #
  #   CSV.foreach("/Users/brianaeng/ada/week5/FarMar/support/vendors.csv") do |line|
  #     if line[3] = id
  #       puts "error"
  #       hash = {id: line[0].to_i, name: line[1], no_of_employees: line[2].to_i, market_id: line[3].to_i}
  #       collection.push(hash)
  #     end
  #   end
  #
  #   return collection
  # end

end

FarMar::Market.make_markets
ap FarMar::Market.find(1)

# FarMar::Market.make_markets
#
# testing = FarMar::Market
#
# testing[0].vendors
