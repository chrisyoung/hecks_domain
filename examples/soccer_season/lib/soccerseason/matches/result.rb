require_relative 'result/factories'

module SoccerSeason
  module Matches
    class Result
      include Helpers::FactoryLoader
      
      attr_reader :loser, :winner

      def initialize loser:, winner:
        @loser = loser
        @winner = winner
      end
    end
  end
end
