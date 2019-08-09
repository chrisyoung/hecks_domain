require_relative 'line_item/factories'
require_relative 'line_item/invariants'

module Pizzeria
  module Orders
    class LineItem
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      
      

      attr_accessor :pizza_name, :quantity, :price, :foo

      def initialize pizza_name:, quantity:, price:, foo: nil
        @pizza_name = pizza_name
        @quantity = quantity
        @price = price
        @foo = foo
      end
    end
  end
end
