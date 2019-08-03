require_relative 'order/factories'
require_relative 'order/repository'
require_relative 'order/commands'

module Pizzeria
  module Orders
    class Order
      include Helpers::FactoryLoader
      include Helpers::Repository
      include Helpers::CommandLoader

      attr_accessor :id, :line_items

      def initialize line_items:
        @line_items = line_items
      end

    end
  end
end
