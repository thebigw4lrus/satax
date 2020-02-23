# PricingPolicy
#
class PricingPolicy
  BASE_TAX = 5
  IMPORTED_TAX = 10

  POLICIES = {
    base: BASE_TAX,
    exempted: -BASE_TAX,
    imported: IMPORTED_TAX
  }.freeze

  def initialize(product, policies = [], calculator = Calculator.new)
    @product = product
    @calculator = calculator
    @policies = policies << :base
  end

  def totalize(qty)
    total_taxes = @calculator.array_sum(all_taxes(qty))
    price_with_taxes = @calculator.simple_sum(total_taxes, product.price)

    Item.new(product, price_with_taxes, total_taxes)
  end

  private

  def all_taxes(qty)
    @policies.map do |policy|
      eval_tax(policy, qty)
    end
  end

  def eval_tax(type, qty)
    tax_value = POLICIES.fetch(type, 0)

    @calculator.get_aliquot(@product.price, qty, tax_value)
  end
end
