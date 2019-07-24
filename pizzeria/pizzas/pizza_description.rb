module Pizzeria
  module Pizzas
    class PizzaDescription
      attr_reader :value

      def initialize value:
        @value = value
      end
    end
  end
end
