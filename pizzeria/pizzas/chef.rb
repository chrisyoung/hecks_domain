module Pizzeria
  module Pizzas
    class Chef
      attr_reader :name

      def initialize name:
        @name = ChefName.new(name)
      end
      def self.reference(id)
        Struct.new(:type, :id).new(self, id)
      end

      def self.fetch(id)
        Repository.fetch(id)
      end

      def self.save(object)
        Repository.save(object)
      end
    end
  end
end
