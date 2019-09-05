['commands', 'services', 'invariants', 'factories', 'repository', 'queries', 'events', 'subscribers'].each do |name|
  Dir[File.dirname(__FILE__) + "/player/#{name}/*.rb"].each { |file| require_relative file }
end

require_relative 'player/repository'
['factories'].each do |name|
  Dir[File.dirname(__FILE__) + "/player/#{name}/*.rb"].each { |file| require_relative file }
end

module SoccerSeason
  module Domain
    module Players
      class Player
        include Support::Factories::FactoryLoader
        include Support::Invariants::InvariantLoader
        include Support::Commands::CommandLoader
        include Support::Queries::QueryLoader

        attr_reader :id, :name, :team, :id

        def initialize(id: nil, name:, team:)
          @id = id
          @name = name
          @team = team
        end

        private

        attr_writer :id, :name, :team
      end
    end
  end
end
