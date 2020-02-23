# Goods
class Goods
  attr_accessor :receipt

  def initialize(pricing_policy, receipt = Receipt.new)
    @pricing_policy = pricing_policy
    @receipt = receipt
  end

  def scan(item, qty)
    item = @pricing_policy[item].totalize(qty)

    @receipt.add(item)
  end

  def generate_receipt
    @receipt.render
  end
end
