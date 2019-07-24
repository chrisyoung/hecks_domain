module Pizzeria
  module Pizzas
    class Topping
      attr_reader :name

      def initialize name:
        @name = name
      end
    end
  end
end
