require_relative 'pizza/factories'
require_relative 'pizza/invariants'
require_relative 'pizza/repository'
require_relative 'pizza/commands'

module Pizzeria
  module Pizzas
    class Pizza
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      include HecksDomain::Commands::CommandLoader

      attr_reader :name, :description, :price, :id

      def initialize(name:, description:, price:, toppings:)
        @name = name
        @description = description
        @price = price
        @toppings = toppings
      end

      def toppings
        @toppings.clone.freeze
      end

      private

      attr_writer :name, :description, :price, :toppings, :id
    end
  end
end
