require_relative 'fixture/factories'

module SoccerSeason
  module Matches
    class Fixture
      include Helpers::FactoryLoader
      
      attr_reader :season, :date, :time

      def initialize season:, date:, time:
        @season = season
        @date = date
        @time = time
      end
    end
  end
end
