require 'spec_helper'

RSpec.describe Goods do
  let(:goods) { Goods.new(pricing_policy) }

  before do
    input.each do |item, qty|
      goods.scan(item, qty)
    end
  end

  context 'example-1' do
    let(:pricing_policy) do
      {
        'book' => PricingPolicy(Product.new(12.49, 'book'), [:exempted]),
        'music-cd' => PricingPolicy(Product.new(14.99, 'music CD')),
        'chocolate-bar' => PricingPolicy(Product.new(0.85, 'chocolate bar'))
      }
    end

    describe '1xBook + 1xmrusic-cd + 1xchocolate-bar' do
      let(:input) { { 'book' => 1, 'music-cd' => 1, 'chocolate-bar' => 1 } }

      it 'gives a total of 32.50€' do
        expect(goods.receipt).to eq(
          'items' => {
            'book' => 12.49,
            'music CD' => 16.49,
            'chocolate bar' => 0.85
          },
          'totals' => {
            'sales-taxes' => 1.50,
            'total' => 29.83
          }
        )
      end
    end
  end

  context 'example-2' do
    let(:pricing_policy) do
      {
        'imp-choco' => Product.new(10.00, [BasicTax.new(5)]),
        'imp-perfume' => Product.new(47.50, [BasicTax.new(5), BasicTax.new(10)])
      }
    end

    describe '1xImported chocolates + 1xPerfume' do
      let(:input) { { 'imp-choco' => 1, 'imp-perfume' => 1 } }

      xit 'gives a total of 32.50€' do
        expect(goods.receipt).to eq(
          'items' => {
            'imp-choco' => 10.50,
            'imp-perfume' => 54.65
          },
          'totals' => {
            'sales-taxes' => 7.65,
            'total' => 65.15
          }
        )
      end
    end
  end
end
