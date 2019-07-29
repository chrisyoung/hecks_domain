require_relative 'order/factories'
require_relative 'order/repository'

module Pizzeria
  module Orders
    class Order
      include Helpers::FactoryLoader
      attr_reader :id, :line_items

      def initialize id: nil, line_items:
        @id = id
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

      def save
        @id = self.class.repository.save(self)
      end

      def self.repository
        Repository
      end
    end
  end
end
