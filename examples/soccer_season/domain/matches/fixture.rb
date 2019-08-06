require_relative 'fixture/factories'

module SoccerSeason
  module Matches
    class Fixture
      include HecksDomain::Factories::FactoryLoader
      
      

      attr_accessor :season, :date, :time

      def initialize season:, date:, time:
        @season = season
        @date = date
        @time = time
      end
    end
  end
end
