require_relative 'pizza_name/factories'
require_relative 'pizza_name/invariants'

module Pizzeria
  module Pizzas
    class PizzaName
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
