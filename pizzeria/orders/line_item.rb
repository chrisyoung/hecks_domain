module Pizzeria
  module Orders
    class LineItem
      attr_reader :pizza_name, :quantity, :price, :foo, :pizza

      def initialize pizza_name:, quantity:, price:, foo: nil, pizza:
        @pizza_name = pizza_name
        @quantity = quantity
        @price = price
        @foo = foo
        @pizza = Pizzas::Pizza.reference(pizza)
      end
    end
  end
end
