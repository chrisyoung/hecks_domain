
module Pizzeria
  module Pizzas
    class PizzaDescription
      attr_reader :id, :value

      def initialize id: nil, value:
        @id = id
        @value = value
      end
      
    end
  end
end
