module Pizzeria
  module Pizzas
    class Bar
      attr_reader :value

      def initialize value:
        @value = value
      end
    end
  end
end
