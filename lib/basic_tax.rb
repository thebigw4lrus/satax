# BasicTax
class BasicTax
  def initialize(value)
    @value = value
  end

  def apply(amount)
    (amount * value) / 100
  end
end
