require_relative 'player/factories'
require_relative 'player/repository'
require_relative 'player/commands'

module SoccerSeason
  module Players
    class Player
      include Helpers::FactoryLoader
      include Helpers::Repository
      include Helpers::CommandLoader

      attr_accessor :id, :name, :team

      def initialize name:, team:
        @name = name
        @team = team
      end

    end
  end
end
