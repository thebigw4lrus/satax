# Goods
class Goods
  attr_accessor :receipt

  def initialize(pricing_policy)
    @pricing_policy = pricing_policy
    @receipt = {
      'items' => {},
      'totals' => {
        'sales-taxes' => 0,
        'totals' => 0
      }
    }
  end

  def scan(item, qty)
    taxes, total = @pricing_policy[item].totalize(qty)

    add_to_receipt!(item, taxes, total)
  end

  private

  def add_to_receipt(item, tax, total)
    @receipt['items'][item] = total
    @receipt['totals']['sales-taxes'] += tax
    @receipt['totals']['total'] += total
  end
end
