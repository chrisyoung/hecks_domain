require_relative 'topping/factories'

module Pizzeria
  module Pizzas
    class Topping
      include HecksDomain::Factories::FactoryLoader
      
      

      attr_accessor :name

      def initialize name:
        @name = name
      end
    end
  end
end
