['factories'].each do |name|
  Dir[File.dirname(__FILE__) + "/goal/#{name}/*.rb"].each { |file| require_relative file }
end

module SoccerSeason
  module Domain
    module Matches
      class Goal
        include Support::Factories::FactoryLoader

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
end
