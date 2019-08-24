require_relative 'foo/factories'
require_relative 'foo/invariants'
require_relative 'foo/repository'
require_relative 'foo/commands'

module FooBar
  module Foos
    class Foo
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      include HecksDomain::Commands::CommandLoader

      attr_reader :bar, :id

      def initialize(bar:)
        @bar = bar
      end

      private

      attr_writer :bar, :id
    end
  end
end
