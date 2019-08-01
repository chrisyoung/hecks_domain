require_relative 'players/commands'
require_relative 'players/player'

module SoccerSeason
  module Players
    include Helpers::CommandLoader

    def self.head
      Player
    end
  end
end
