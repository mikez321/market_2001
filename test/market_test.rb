require './lib/market'
require './lib/vendor'
require './lib/item'
require 'minitest/autorun'
require 'minitest/test'
require 'minitest/pride'

class MarketTest < Minitest::Test
  def setup
    @market = Market.new("South Pearl Street Farmers Market")
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @vendor1.stock(@item1, 35)
    @vendor1.stock(@item2, 7)
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)
    @vendor3 = Vendor.new("Palisade Peach Shack")
    @vendor3.stock(@item1, 65)
    @market.add_vendor(@vendor1)
    @market.add_vendor(@vendor2)
    @market.add_vendor(@vendor3)
  end

  def test_it_exists
    assert_instance_of Market, @market
  end

  def test_it_has_attributes
    market = Market.new("South Pearl Street Farmers Market")
    assert_equal "South Pearl Street Farmers Market", market.name
    assert_equal [], market.vendors
  end

  def test_it_can_add_vendors
    market = Market.new("South Pearl Street Farmers Market")
    market.add_vendor(@vendor1)
    market.add_vendor(@vendor2)
    market.add_vendor(@vendor3)

    assert_equal [@vendor1, @vendor2, @vendor3], market.vendors
  end

  def test_it_knows_vendor_names
    assert_equal ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"], @market.vendor_names
  end

  def test_it_knows_vendors_that_sell_an_item
    assert_equal [@vendor1, @vendor3], @market.vendors_that_sell(@item1)

    assert_equal [@vendor2], @market.vendors_that_sell(@item4)
  end

  def test_it_knows_potential_revenues_for_vendors
    assert_equal 29.75, @vendor1.potential_revenue
  end

  def test_it_can_return_potential_revenues_for_vendors
    assert_equal 345.00, @vendor2.potential_revenue
    assert_equal 48.75, @vendor3.potential_revenue
  end

  def test_it_can_make_a_sorted_item_list
    assert_equal ["Banana Nice Cream", "Peach", "Peach-Raspberry Nice Cream", "Tomato"], @market.sorted_item_list
  end
end
