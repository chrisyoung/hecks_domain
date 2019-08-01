require_relative 'pizza/factories'
require_relative 'pizza/repository'

module Pizzeria
  module Pizzas
    class Pizza
      include Helpers::FactoryLoader
      include Helpers::Repository
      attr_reader :id, :name, :description, :price, :toppings

      def initialize name:, description:, price:, toppings:
        @name = name
        @description = description
        @price = price
        @toppings = toppings
      end
    end
  end
end
