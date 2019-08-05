require_relative 'player/factories'
require_relative 'player/repository'
require_relative 'player/commands'

module SoccerSeason
  module Players
    class Player
      include HecksDomain::Factories::FactoryLoader
      include Helpers::Repository
      include HecksDomain::Commands::CommandLoader

      attr_accessor :name, :team, :id

      def initialize name:, team:
        @name = name
        @team = team
      end
    end
  end
end
