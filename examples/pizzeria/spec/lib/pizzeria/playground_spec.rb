require 'spec_helper'
require_relative '../../../../../lib/domain'

describe "Playground" do
  let(:pizza) do
    Pizzeria::Pizzas::Pizza.new(
      name: { value: 'pepperoni' }, 
      description: { value: 'a classic' }, 
      toppings: [{ name: 'pepperoni' }],
      price: 1.00
    )
  end

  let(:line_item) do 
    {
      pizza_name: 'Pepperoni',
      quantity: 1,
      price: 1.00
    }
  end

  let(:order) do 
    Pizzeria::Orders::Order.new(
      line_items: [line_item]
    )
  end
  
  describe '#create' do
    it 'saves the order' do
      Pizzeria::Orders.create order
      expect(Pizzeria::Orders::Order.fetch(order.id)).to eq order
      order.line_items << Pizzeria::Orders::LineItem.from_pizza(pizza)
      expect(order.line_items.count).to eq 2
    end
  end
end
