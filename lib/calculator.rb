require 'bigdecimal'

# Calculator
class Calculator
  ROUND_FACTOR = 2

  def get_aliquot(price, qty, factor)
    price = BigDecimal(mult(price, qty).to_s)
    factor = BigDecimal(factor.to_s)
    hundred = BigDecimal(100)

    mult(div(factor, hundred), price).to_f
  end

  def simple_sum(num1, num2)
    (num1 + num2).round(ROUND_FACTOR)
  end

  def array_sum(array)
    array.inject(0) do |x, y|
      simple_sum(BigDecimal(x), BigDecimal(y))
    end
  end

  private

  def mult(num1, num2)
    (num1 * num2).round(ROUND_FACTOR)
  end

  def div(num1, num2)
    (num1 / num2).round(ROUND_FACTOR)
  end

end
