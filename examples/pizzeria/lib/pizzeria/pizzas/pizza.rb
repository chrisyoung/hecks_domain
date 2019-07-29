  require_relative 'pizza/repository'

module Pizzeria
  module Pizzas
    class Pizza
      attr_reader :id, :name, :description, :price, :toppings

      def initialize id: nil, name:, description:, price:, toppings:
        @id = id
        @name = PizzaName.new(name)
        @description = PizzaDescription.new(description)
        @price = price
        @toppings = toppings.map do |object|
          Topping.new(object)
        end
      end
      
      def self.reference(id)
        Struct.new(:type, :id).new(self, id)
      end

      def self.fetch(id)
        repository.fetch(id)
      end

      def save
        @id = self.class.repository.save(self)
      end

      def self.repository
        Repository
      end
    end
  end
end
