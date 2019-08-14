require_relative 'order/factories'
require_relative 'order/invariants'
require_relative 'order/repository'
require_relative 'order/commands'

module Pizzeria
  module Orders
    class Order
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      include HecksDomain::Commands::CommandLoader

      attr_reader :id

      def initialize(line_items:)
        @line_items = line_items
      end

      def line_items
        @line_items.clone.freeze
      end

      private

      attr_writer :line_items, :id
    end
  end
end
