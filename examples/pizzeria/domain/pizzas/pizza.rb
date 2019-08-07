require_relative 'pizza/factories'
require_relative 'pizza/repository'
require_relative 'pizza/commands'

module Pizzeria
  module Pizzas
    class Pizza
      include HecksDomain::Factories::FactoryLoader
      include Helpers::Repository
      include HecksDomain::Commands::CommandLoader

      attr_accessor :name, :description, :price, :toppings, :id

      def initialize name:, description:, price:, toppings:
        @name = name
        @description = description
        @price = price
        @toppings = toppings
      end
    end
  end
end
