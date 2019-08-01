require_relative 'line_item/factories'

module Pizzeria
  module Orders
    class LineItem
      include Helpers::FactoryLoader
      
      attr_reader :pizza_name, :quantity, :price, :foo

      def initialize pizza_name:, quantity:, price:, foo: nil
        @pizza_name = pizza_name
        @quantity = quantity
        @price = price
        @foo = foo
      end
    end
  end
end
