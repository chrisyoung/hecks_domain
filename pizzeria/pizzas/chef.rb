module Pizzeria
  module Pizzas
    class Chef
      attr_reader :name

      def initialize name:
        @name = name
      end
      def self.reference(id)
        Struct.new(:type, :id).new(self, id)
      end
    end
  end
end
