['commands', 'services', 'invariants', 'factories', 'repository', 'queries', 'events', 'subscribers'].each do |name|
  Dir[File.dirname(__FILE__) + "/match/#{name}/*.rb"].each { |file| require_relative file }
end

require_relative 'match/repository'
['factories'].each do |name|
  Dir[File.dirname(__FILE__) + "/match/#{name}/*.rb"].each { |file| require_relative file }
end

module SoccerSeason
  module Domain
    module Matches
      class Match
        include Support::Factories::FactoryLoader
        include Support::Invariants::InvariantLoader
        include Support::Commands::CommandLoader
        include Support::Queries::QueryLoader

        attr_reader :id, :fixture, :result, :pitch, :id

        def initialize(id: nil, fixture:, goals: [], result: nil, teams:, pitch:)
          @id = id
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

        attr_writer :id, :fixture, :goals, :result, :teams, :pitch
      end
    end
  end
end
