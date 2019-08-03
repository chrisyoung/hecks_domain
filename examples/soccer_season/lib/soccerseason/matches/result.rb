require_relative 'result/factories'

module SoccerSeason
  module Matches
    class Result
      include Helpers::FactoryLoader
      
      

      attr_accessor :loser, :winner, :tied

      def initialize loser:, winner:
        @loser = loser
        @winner = winner
        @tied = nil
      end
    end
  end
end
