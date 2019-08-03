require_relative 'matches/match'
require_relative 'matches/result'
require_relative 'matches/goal'
require_relative 'matches/fixture'
require_relative 'matches/pitch'

module SoccerSeason
  module Matches
    def self.head
      Match
    end
  end
end
