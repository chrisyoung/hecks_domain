require_relative 'goal/factories'
require_relative 'goal/invariants'

module SoccerSeason
  module Matches
    class Goal
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      

      attr_accessor :time, :player

      def initialize(time:, player:)
        @time = time
        @player = player
      end
    end
  end
end
