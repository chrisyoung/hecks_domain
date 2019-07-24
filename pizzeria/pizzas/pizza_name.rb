module Pizzeria
  module Pizzas
    class PizzaName
      attr_reader :value

      def initialize value:
        @value = value
      end
    end
  end
end
