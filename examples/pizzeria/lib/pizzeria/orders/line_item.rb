
module Pizzeria
  module Orders
    class LineItem
      attr_reader :id, :pizza_name, :quantity, :price, :foo

      def initialize id: nil, pizza_name:, quantity:, price:, foo: nil
        @id = id
        @pizza_name = pizza_name
        @quantity = quantity
        @price = price
        @foo = foo
      end
      
    end
  end
end
