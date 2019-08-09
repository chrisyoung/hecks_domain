require_relative 'pizza_name/factories'
require_relative 'pizza_name/invariants'

module Pizzeria
  module Pizzas
    class PizzaName
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      
      

      attr_accessor :value

      def initialize value:
        @value = value
      end
    end
  end
end
