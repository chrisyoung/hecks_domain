require_relative 'pizza_description/factories'

module Pizzeria
  module Pizzas
    class PizzaDescription
      include HecksDomain::Factories::FactoryLoader
      
      

      attr_accessor :value

      def initialize value:
        @value = value
      end
    end
  end
end
