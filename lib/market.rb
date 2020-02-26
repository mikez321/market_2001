class Market
  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    vendors.find_all do |vendor|
      vendor.inventory.include?(item)
    end
  end

  def sorted_item_list
    vendors.flat_map do |vendor|
      vendor.inventory.map do |item|
        item.first.name
      end
    end.uniq.sort
  end

  def overstocked_items
    overstock = vendors.reduce({}) do |acc, vendor|
      vendor.inventory.each do |item|
      acc[item.first] = item.last
      end
    acc
    end
    x = overstock.find_all do |item|
      item.last > 50
    end.flatten
    x.find_all do |item|
      vendors_that_sell(item).length > 1
    end
  end
end
