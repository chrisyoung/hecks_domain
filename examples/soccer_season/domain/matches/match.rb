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

      attr_reader :fixture, :result, :pitch, :id

      def initialize(fixture:, goals: [], result: nil, teams:, pitch:)
        @fixture = fixture
        @goals = goals
        @result = result
        @teams = teams
        @pitch = pitch
      end

      def goals
        @goals.clone.freeze
      end

      def teams
        @teams.clone.freeze
      end

      private

      attr_writer :fixture, :goals, :result, :teams, :pitch, :id
    end
  end
end
