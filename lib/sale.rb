require_relative '../far_mar'
require 'csv'

class FarMar::Sale
  def self.make_sales
    @sales = []
    CSV.foreach("/Users/brianaeng/ada/week5/FarMar/support/sales.csv") do |line|
      time = DateTime.parse(line[2])
      sale_hash = {id: line[0].to_i, amount: line[1].to_i, purchase_time: time, vendor_id: line[3].to_i, product_id: line[4].to_i}
      @sales.push(sale_hash)
    end
  end

  def self.all
    return @sales
  end

  def self.find(id)
    @sales.each do |sale|
      if sale[:id] == id
        return sale
      end
    end
  end
end
