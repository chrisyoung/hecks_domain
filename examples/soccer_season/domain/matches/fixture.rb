require_relative 'fixture/factories'
require_relative 'fixture/invariants'

module SoccerSeason
  module Matches
    class Fixture
      include HecksDomain::Factories::FactoryLoader
      include HecksDomain::Invariants::InvariantLoader
      
      

      attr_accessor :season, :date, :time

      def initialize season:, date:, time:
        @season = season
        @date = date
        @time = time
      end
    end
  end
end
