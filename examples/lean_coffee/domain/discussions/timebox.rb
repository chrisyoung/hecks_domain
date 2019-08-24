require_relative 'timebox/factories'
require_relative 'timebox/invariants'

module LeanCoffee
  module Discussions
    class Timebox
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      

      attr_reader :duration, :extension

      def initialize(duration:, extension:)
        @duration = duration
        @extension = extension
      end

      private

      attr_writer :duration, :extension
    end
  end
end
