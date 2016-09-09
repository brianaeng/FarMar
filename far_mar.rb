require 'csv'
require 'awesome_print'

module FarMar; end

require_relative 'lib/market'
require_relative 'lib/product'
require_relative 'lib/sale'
require_relative 'lib/vendor'

# #MARKET METHODS
# ap FarMar::Market.find(493)
#
# testing1 = FarMar::Market.all
# ap testing1[492].vendors
# ap testing1[492].products
# ap testing1[2].prefered_vendor
# ap testing1[2].worst_vendor
#
# ap FarMar::Market.search('Stamm')
#
# #VENDOR METHODS
# ap FarMar::Vendor.find(40)
#
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
# ap FarMar::Vendor.by_market(43)
#
# ap FarMar::Vendor.most_revenue(34)
#
# #PRODUCT METHODS
# ap FarMar::Product.find(2432)
#
# testing6 = FarMar::Product.all
# ap testing6[166].vendor
# ap testing6[166].sales
# ap testing6[166].number_of_sales
#
# ap FarMar::Product.by_vendor
#
# # SALE METHODS
# ap FarMar::Sale.find(424)
#
# testing7 = FarMar::Sale.all
#
# ap testing7[166].product
#
# ap FarMar::Sale.between('2013-11-08 04:31:41 -0800', '2013-11-08 05:19:05 -0800')
