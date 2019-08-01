require_relative 'topping/factories'

module Pizzeria
  module Pizzas
    class Topping
      include Helpers::FactoryLoader
      
      attr_reader :name

      def initialize name:
        @name = name
      end
    end
  end
end
