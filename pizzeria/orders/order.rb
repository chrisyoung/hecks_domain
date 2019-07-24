module Pizzeria
  module Orders
    class Order
      attr_reader :line_items

      def initialize line_items:
        @line_items = line_items.map do |object|
          LineItem.new(object)
        end
      end
      def self.reference(id)
        Struct.new(:type, :id).new(self, id)
      end

      def self.fetch(id)
        repository.fetch(id)
      end

      def self.save(object)
        repository.save(object)
      end

      def self.repository
        Repository
      end
    end
  end
end
