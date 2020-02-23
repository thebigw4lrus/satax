# Item
class Item
  attr_accessor :product, :price_with_taxes, :total_Taxes

  def initialize(product, price_with_taxes, total_taxes)
    @product = product
    @price_with_taxes = price_with_taxes
    @total_taxes = total_taxes
  end
end
