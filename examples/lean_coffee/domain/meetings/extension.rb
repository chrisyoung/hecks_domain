['factories'].each do |name|
  Dir[File.dirname(__FILE__) + "/extension/#{name}/*.rb"].each { |file| require_relative file }
end

module LeanCoffee
  module Meetings
    class Extension
      include HecksDomain::Factories::FactoryLoader

      attr_reader :yes_votes, :no_votes

      def initialize(yes_votes:, no_votes:)
        @yes_votes = yes_votes
        @no_votes = no_votes
      end

      private

      attr_writer :yes_votes, :no_votes
    end
  end
end
