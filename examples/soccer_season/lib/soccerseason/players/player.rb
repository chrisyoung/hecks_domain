require_relative 'player/factories'
require_relative 'player/repository'

module SoccerSeason
  module Players
    class Player
      include Helpers::FactoryLoader
      include Helpers::Repository
      attr_reader :id, :name, :team

      def initialize name:, team:
        @name = name
        @team = team
      end
    end
  end
end
