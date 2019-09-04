['factories'].each do |name|
  Dir[File.dirname(__FILE__) + "/pitch/#{name}/*.rb"].each { |file| require_relative file }
end

module SoccerSeason
  module Domain
    module Matches
      class Pitch
        include HecksDomain::Factories::FactoryLoader

        attr_reader :name

        def initialize(name:)
          @name = name
        end

        private

        attr_writer :name
      end
    end
  end
end
