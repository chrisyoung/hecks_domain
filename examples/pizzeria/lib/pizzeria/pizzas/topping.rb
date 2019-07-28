
module Pizzeria
  module Pizzas
    class Topping
      attr_reader :id, :name

      def initialize id: nil, name:
        @id = id
        @name = name
      end
      
    end
  end
end
