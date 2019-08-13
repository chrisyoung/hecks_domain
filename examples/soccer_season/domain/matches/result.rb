require_relative 'result/factories'
require_relative 'result/invariants'

module SoccerSeason
  module Matches
    class Result
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      

      attr_reader :loser, :winner, :tied

      def initialize(loser:, winner:)
        @loser = loser
        @winner = winner
        @tied = nil
      end
      
      def tied?
        @tied
      end

      private

      attr_writer :loser, :winner, :tied
    end
  end
end
