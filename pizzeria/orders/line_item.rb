module Pizzeria
  module Orders
    class LineItem
      attr_reader :pizza, :pizza_name, :quantity, :price, :foo

      def initialize pizza:, pizza_name:, quantity:, price:, foo: nil
        @pizza = Pizzas::Pizza.reference(pizza)
        @pizza_name = pizza_name
        @quantity = quantity
        @price = price
        @foo = foo
      end
    end
  end
end
