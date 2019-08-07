require_relative 'order/factories'
require_relative 'order/repository'
require_relative 'order/commands'

module Pizzeria
  module Orders
    class Order
      include HecksDomain::Factories::FactoryLoader
      include Helpers::Repository
      include HecksDomain::Commands::CommandLoader

      attr_accessor :line_items, :id

      def initialize line_items:
        @line_items = line_items
      end
    end
  end
end
