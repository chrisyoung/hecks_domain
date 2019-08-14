require_relative 'pizza_description/factories'
require_relative 'pizza_description/invariants'

module Pizzeria
  module Pizzas
    class PizzaDescription
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      

      attr_reader :value

      def initialize(value:)
        @value = value
      end

      private

      attr_writer :value
    end
  end
end
