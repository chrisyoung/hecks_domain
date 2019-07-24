module Pizzeria
  module Pizzas
    class Pizza
      attr_reader :toppings, :named_by, :name, :description

      def initialize toppings:, named_by:, name:, description:
        @toppings = toppings.map do |object|
          Topping.new(object)
        end
        @named_by = Chef.new(named_by)
        @name = name
        @description = description
      end
      def self.reference(id)
        Struct.new(:type, :id).new(self, id)
      end
    end
  end
end
