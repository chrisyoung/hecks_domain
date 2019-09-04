['factories'].each do |name|
  Dir[File.dirname(__FILE__) + "/tied_result/#{name}/*.rb"].each { |file| require_relative file }
end

module SoccerSeason
  module Domain
    module Matches
      class TiedResult
        include Support::Factories::FactoryLoader

        attr_reader 

        def initialize()
        end

        private

        attr_writer 
      end
    end
  end
end
