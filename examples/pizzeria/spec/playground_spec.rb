require 'spec_helper'

describe "Playground" do
  let(:pizza) do
    Pizzeria::Pizzas::Pizza.new(
      name: Pizzeria::Pizzas::PizzaName.new(value: 'pepperoni'),
      description: Pizzeria::Pizzas::PizzaDescription.new(value: 'a classic'),
      toppings: [Pizzeria::Pizzas::Topping.new(name: 'pepperoni')],
      price: 1.00
    )
  end

  let(:line_item) do
    Pizzeria::Orders::LineItem.new(
      pizza_name: 'Pepperoni',
      quantity: 1,
      price: 1.00
    )
  end

  let(:order) do
    Pizzeria::Orders::Order.new(
      line_items: [line_item]
    )
  end

  describe '#create' do
    it 'saves the order' do
      order.create!
      order.add_pizza!(pizza)
      expect(order.line_items.count).to eq 2
    end
  end
end
