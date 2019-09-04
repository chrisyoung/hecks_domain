['factories'].each do |name|
  Dir[File.dirname(__FILE__) + "/fixture/#{name}/*.rb"].each { |file| require_relative file }
end

module SoccerSeason
  module Domain
    module Matches
      class Fixture
        include HecksDomain::Factories::FactoryLoader

        attr_reader :season, :date, :time

        def initialize(season:, date:, time:)
          @season = season
          @date = date
          @time = time
        end

        private

        attr_writer :season, :date, :time
      end
    end
  end
end
