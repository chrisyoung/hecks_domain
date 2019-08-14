require_relative 'topping/factories'
require_relative 'topping/invariants'

module Pizzeria
  module Pizzas
    class Topping
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      

      attr_reader :name

      def initialize(name:)
        @name = name
      end

      private

      attr_writer :name
    end
  end
end
