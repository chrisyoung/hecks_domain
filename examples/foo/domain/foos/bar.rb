require_relative 'bar/factories'
require_relative 'bar/invariants'

module FooBar
  module Foos
    class Bar
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
