require_relative '../far_mar'
require 'csv'

class FarMar::Market
  # attr_accessor :markets

  def self.make_markets
    @markets = []
    CSV.foreach("/Users/brianaeng/ada/week5/FarMar/support/markets.csv") do |line|
      market_hash = {id: line[0].to_i, name: line[1], address: line[2], city: line[3], county: line[4], state: line[5], zip: line[6]}
      @markets.push(market_hash)
    end
  end

  def self.all
    return @markets
  end

  def self.find(id)
    @markets.each do |market|
      if market[:id] == id
        return market
      end
    end
  end
end
