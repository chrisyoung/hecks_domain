require_relative 'pitch/factories'
require_relative 'pitch/invariants'

module SoccerSeason
  module Matches
    class Pitch
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
