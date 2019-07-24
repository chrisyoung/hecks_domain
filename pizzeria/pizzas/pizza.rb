module Pizzeria
  module Pizzas
    class Pizza
      attr_reader :name, :description, :named_by, :toppings

      def initialize name:, description:, named_by:, toppings:
        @name = PizzaName.new(name)
        @description = PizzaDescription.new(description)
        @named_by = Chef.new(named_by)
        @toppings = toppings.map do |object|
          Topping.new(object)
        end
      end
      def self.reference(id)
        Struct.new(:type, :id).new(self, id)
      end
    end
  end
end
