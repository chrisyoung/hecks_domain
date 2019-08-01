require_relative 'goal/factories'

module SoccerSeason
  module Matches
    class Goal
      include Helpers::FactoryLoader
      
      attr_reader :time, :player

      def initialize time:, player:
        @time = time
        @player = player
      end
    end
  end
end
