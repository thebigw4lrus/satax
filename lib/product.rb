# Product
class Product
  def initialize(price, tax_schema)
    @price = price
    @tax_schema = tax_schema
  end

  def totalize(qty)
    [all_taxes, price * qty + all_taxes]
  end

  private

  def all_taxes
    tax_schema.map do |tax|
      tax.apply(price)
    end.sum
  end
end
