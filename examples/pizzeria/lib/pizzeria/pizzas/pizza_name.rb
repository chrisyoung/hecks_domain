require_relative 'pizza_name/factories'

module Pizzeria
  module Pizzas
    class PizzaName
      include Helpers::FactoryLoader
      attr_reader :id, :value

      def initialize id: nil, value:
        @id = id
        @value = value
      end
      
    end
  end
end
