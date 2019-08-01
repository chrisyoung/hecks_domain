require_relative 'pitches/commands'
require_relative 'pitches/pitch'

module SoccerSeason
  module Pitches
    include Helpers::CommandLoader

    def self.head
      Pitch
    end
  end
end
