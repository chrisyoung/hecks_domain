require_relative 'teams/commands'
require_relative 'teams/team'

module SoccerSeason
  module Teams
    include Helpers::CommandLoader

    def self.head
      Team
    end
  end
end
