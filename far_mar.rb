require 'csv'
require 'awesome_print'

module FarMar; end

require_relative 'lib/market'
require_relative 'lib/product'
require_relative 'lib/sale'
require_relative 'lib/vendor'

# #MARKET INSTANCE METHOD
# testing1 = FarMar::Market.all
# ap testing1[492].vendors
#
# #VENDOR INSTANCE METHODS
# testing2 = FarMar::Vendor.all
# ap testing2[7].market
#
# testing3 = FarMar::Vendor.all
# ap testing3[492].products
#
# testing4 = FarMar::Vendor.all
# ap testing4[13].sales
#
# testing5 = FarMar::Vendor.all
# ap testing5[0].revenue
#
# ap FarMar::Vendor.by_market(1)

#PRODUCT INSTANCE METHODS
testing6 = FarMar::Product.all
ap testing6[166].vendor
