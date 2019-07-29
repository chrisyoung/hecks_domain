require_relative 'topping/factories'

module Pizzeria
  module Pizzas
    class Topping
      include Helpers::FactoryLoader
      attr_reader :id, :name

      def initialize id: nil, name:
        @id = id
        @name = name
      end
      
    end
  end
end
