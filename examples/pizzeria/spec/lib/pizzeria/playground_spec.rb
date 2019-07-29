require 'spec_helper'
describe "Playground" do
  let(:domain) do
    Domain.domain(:Pizzeria) do
      aggregate :Pizzas do
        head :Pizza do
          value(:name).as :PizzaName
          value(:description).as :PizzaDescription
          currency(:price)
          list(:toppings).as :Topping
        end
        value(:Topping) { string :name }
        value(:PizzaName) { string :value }
        value(:PizzaDescription) { string :value }
      end
    
      aggregate :Orders do
        head(:Order) { list(:line_items).as :LineItem }
        value :LineItem do
          string :pizza_name
          integer :quantity
          currency :price
          optional string :foo
        end
      end
    end
  end

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
      domain.build
      domain.dump
      Pizzeria::Orders.create order
      expect(Pizzeria::Orders::Order.fetch(order.id)).to eq order
      order.line_items << Pizzeria::Orders::LineItem.from_pizza(pizza)
      expect(order.line_items.count).to eq 2
    end
  end
end
