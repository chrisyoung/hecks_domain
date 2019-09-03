['factories'].each do |name|
  Dir[File.dirname(__FILE__) + "/result/#{name}/*.rb"].each { |file| require_relative file }
end

module SoccerSeason
  module Matches
    class Result
      include HecksDomain::Factories::FactoryLoader

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
