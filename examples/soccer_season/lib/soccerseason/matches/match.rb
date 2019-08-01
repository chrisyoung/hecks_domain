require_relative 'match/factories'
require_relative 'match/repository'

module SoccerSeason
  module Matches
    class Match
      include Helpers::FactoryLoader
      include Helpers::Repository
      attr_reader :id, :fixture, :goals, :teams, :pitch, :result

      def initialize fixture:, goals:, teams:, pitch:, result:
        @fixture = fixture
        @goals = goals
        @teams = teams
        @pitch = pitch
        @result = result
      end
    end
  end
end
