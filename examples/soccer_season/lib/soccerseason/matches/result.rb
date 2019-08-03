require_relative 'result/factories'

module SoccerSeason
  module Matches
    class Result
      include Helpers::FactoryLoader
      
      attr_accessor :loser, :winner

      def initialize loser:, winner:
        @loser = loser
        @winner = winner
        @tied = true unless loser && winner
      end

      def tied?
        @tied
      end
    end
  end
end
