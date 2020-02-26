require './lib/vendor'
require 'minitest/autorun'
require 'minitst/test'

class VendorTest < Minitest::Test

  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  def test_it_has_attributes
    assert_equal "Rocky Mountain Fresh", @vendor.name
    assert_equal ({}), @vendor.inventory
  end

end
#
#
# @vendor.check_stock(@item1)
# #=> 0
#
# @vendor.stock(@item1, 30)
#
# @vendor.inventory
# #=> {#<Item:0x007f9c56740d48...> => 30}
#
# @vendor.check_stock(@item1)
# #=> 30
#
# @vendor.stock(@item1, 25)
#
# @vendor.check_stock(@item1)
# #=> 55
#
# @vendor.stock(item2, 12)
#
# @vendor.inventory
