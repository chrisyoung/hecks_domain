require_relative 'result/factories'
require_relative 'result/invariants'

module SoccerSeason
  module Matches
    class Result
      include HecksDomain::Factories::FactoryLoader
      include Invariants
      
      

      attr_accessor :loser, :winner, :tied

      def initialize loser:, winner:
        @loser = loser
        @winner = winner
        @tied = nil
      end
      
      def tied?
        @tied
      end
    end
  end
end
