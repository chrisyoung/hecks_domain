require_relative 'pizza_description/factories'

module Pizzeria
  module Pizzas
    class PizzaDescription
      include Helpers::FactoryLoader
      attr_reader :id, :value

      def initialize id: nil, value:
        @id = id
        @value = value
      end
      
    end
  end
end
