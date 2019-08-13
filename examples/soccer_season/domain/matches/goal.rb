require_relative 'goal/factories'
require_relative 'goal/invariants'

module SoccerSeason
  module Matches
    class Goal
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      

      attr_reader :time, :player

      def initialize(time:, player:)
        @time = time
        @player = player
      end

      private

      attr_writer :time, :player
    end
  end
end
