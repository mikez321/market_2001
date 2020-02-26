require './lib/vendor'
require './lib/item'
require 'minitest/autorun'
require 'minitest/test'
require 'minitest/pride'

class VendorTest < Minitest::Test

  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  def test_it_has_attributes
    assert_equal "Rocky Mountain Fresh", @vendor.name
    assert_equal ({}), @vendor.inventory
  end

  def test_it_can_check_its_stock
    assert_equal 0, @vendor.check_stock(@item1)
  end

end

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
