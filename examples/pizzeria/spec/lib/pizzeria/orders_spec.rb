require 'spec_helper'
describe Pizzeria::Orders do
  let(:pizza) do
    Pizzeria::Pizzas::Pizza.new(name: {value: 'pepperoni'}, description: {value: 'a classic'}, named_by: {name: {value: 'Chris'}}, toppings: [{name: 'pepperoni'}])
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
      # order.line_items << Pizzeria::Orders::LineItem::Factories.from_pizza(pizza)
      Pizzeria::Orders.create(order)
      expect(Pizzeria::Orders::Order.fetch(order.id)).to eq order  
    end
  end
end
