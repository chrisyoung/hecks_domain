require_relative 'match/factories'
require_relative 'match/invariants'
require_relative 'match/repository'
require_relative 'match/commands'

module SoccerSeason
  module Matches
    class Match
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      include HecksDomain::Commands::CommandLoader

      attr_accessor :fixture, :goals, :result, :teams, :pitch, :id

      def initialize(fixture:, goals: [], result: nil, teams:, pitch:)
        @fixture = fixture
        @goals = goals
        @result = result
        @teams = teams
        @pitch = pitch
      end
    end
  end
end
