require 'spec_helper'

RSpec.describe Goods do
  let(:pricing_policy) do
    {
      'book' => Product.new(12.49, [BasicTax.new(5)]),
      'music-cd' => Product.new(14.99, [BasixTax.new(5)]),
      'chocolate-bar' => Product.new(0.85, [BasicTax.new(5)])
    }
  end
  let(:goods) { Goods.new(pricing_policy) }

  before do
    input.each do |item, qty|
      goods.scan(item, qty)
    end
  end

  describe '1xBook + 1xmrusic-cd + 1xchocolate-bar' do
    let(:input) { { 'book' => 1, 'music-cd' => 1, 'chocolate-bar' => 1 } }

    it 'gives a total of 32.50€' do
      expect(goods.receipt).to eq(
        'items' => {
          'book' => 12.49,
          'music-cd' => 16.49,
          'chocolate-bar' => 0.85
        },
        'totals' => {
          'sales-taxes' => 1.50,
          'total' => 29.83
        }
      )
    end
  end
end
