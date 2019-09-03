['commands', 'services', 'invariants', 'factories', 'repository', 'queries', 'events', 'subscribers'].each do |name|
  Dir[File.dirname(__FILE__) + "/player/#{name}/*.rb"].each { |file| require_relative file }
end

require_relative 'player/repository'
['factories'].each do |name|
  Dir[File.dirname(__FILE__) + "/player/#{name}/*.rb"].each { |file| require_relative file }
end

module SoccerSeason
  module Players
    class Player
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      include HecksDomain::Commands::CommandLoader
      include HecksDomain::Queries::QueryLoader

      attr_reader :name, :team, :id

      def initialize(name:, team:)
        @name = name
        @team = team
      end

      private

      attr_writer :name, :team, :id
    end
  end
end
