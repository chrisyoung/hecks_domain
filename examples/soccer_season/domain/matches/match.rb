['commands', 'services', 'invariants', 'factories', 'repository', 'queries', 'events', 'subscribers'].each do |name|
  Dir[File.dirname(__FILE__) + "/match/#{name}/*.rb"].each { |file| require_relative file }
end

require_relative 'match/repository'
['factories'].each do |name|
  Dir[File.dirname(__FILE__) + "/match/#{name}/*.rb"].each { |file| require_relative file }
end

module SoccerSeason
  module Matches
    class Match
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      include HecksDomain::Commands::CommandLoader
      include HecksDomain::Queries::QueryLoader

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
