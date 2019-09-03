['factories'].each do |name|
  Dir[File.dirname(__FILE__) + "/goal/#{name}/*.rb"].each { |file| require_relative file }
end

module SoccerSeason
  module Matches
    class Goal
      include HecksDomain::Factories::FactoryLoader

      attr_reader :time, :player

      def initialize(time:, player:)
        @time = time
        @player = player
      end

      private

      attr_writer :time, :player
    end
  end
end
