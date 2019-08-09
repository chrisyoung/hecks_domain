require_relative 'topping/factories'
require_relative 'topping/invariants'

module Pizzeria
  module Pizzas
    class Topping
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      
      

      attr_accessor :name

      def initialize name:
        @name = name
      end
    end
  end
end
