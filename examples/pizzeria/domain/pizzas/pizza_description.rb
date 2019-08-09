require_relative 'pizza_description/factories'
require_relative 'pizza_description/invariants'

module Pizzeria
  module Pizzas
    class PizzaDescription
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      
      

      attr_accessor :value

      def initialize value:
        @value = value
      end
    end
  end
end
