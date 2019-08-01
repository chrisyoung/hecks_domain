require_relative 'order/factories'
require_relative 'order/repository'

module Pizzeria
  module Orders
    class Order
      include Helpers::FactoryLoader
      include Helpers::Repository
      attr_reader :id, :line_items

      def initialize line_items:
        @line_items = line_items
      end
    end
  end
end
