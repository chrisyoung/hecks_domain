require_relative 'pizza_name/factories'

module Pizzeria
  module Pizzas
    class PizzaName
      include HecksDomain::Factories::FactoryLoader
      
      

      attr_accessor :value

      def initialize value:
        @value = value
      end
    end
  end
end
