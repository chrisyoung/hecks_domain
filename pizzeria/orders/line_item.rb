module Pizzeria
  module Orders
    class LineItem
      attr_reader :id, :pizza_name, :quantity, :price, :foo, :pizza

      def initialize id: nil, pizza_name:, quantity:, price:, foo: nil, pizza:
        @id = id
        @pizza_name = pizza_name
        @quantity = quantity
        @price = price
        @foo = foo
        @pizza = Pizzas::Pizza.reference(pizza)
      end
      
    end
  end
end
