require_relative 'goal/factories'

module SoccerSeason
  module Matches
    class Goal
      include HecksDomain::Factories::FactoryLoader
      
      

      attr_accessor :time, :player

      def initialize time:, player:
        @time = time
        @player = player
      end
    end
  end
end
