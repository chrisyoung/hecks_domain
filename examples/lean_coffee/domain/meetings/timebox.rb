require_relative 'timebox/factories'
require_relative 'timebox/invariants'

module LeanCoffee
  module Meetings
    class Timebox
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      

      attr_reader :duration

      def initialize(duration:)
        @duration = duration
      end

      private

      attr_writer :duration
    end
  end
end
