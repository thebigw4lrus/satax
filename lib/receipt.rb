# Receipt class
#
class Receipt
  def initialize(calculator = Calculator.new)
    @calculator = calculator
    @raw_items = []
    @items = {}
    @totals = {
      'sales-taxes' => 0,
      'total' => 0
    }
  end

  def add(item)
    @raw_items << item
  end

  def render
    @raw_items.each do |item|
      render_raw_item(item)
    end

    build_response
  end

  private

  def build_response
    {
      'items' => @items,
      'totals' => @totals
    }
  end

  def render_raw_item(item)
    description = item.product.description
    price_with_taxes = item.price_with_taxes
    total_taxes = item.total_taxes

    @items[description] = price_with_taxes
    @totals['sales-taxes'] += total_taxes
    @totals['total'] += price_with_taxes
  end
end
