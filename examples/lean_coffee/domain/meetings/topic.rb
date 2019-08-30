['factories'].each do |name|
  Dir[File.dirname(__FILE__) + "/topic/#{name}/*.rb"].each { |file| require_relative file }
end

module LeanCoffee
  module Meetings
    class Topic
      include HecksDomain::Factories::FactoryLoader

      attr_reader :value, :votes, :timebox

      def initialize(value:, votes:, timebox:)
        @value = value
        @votes = votes
        @timebox = timebox
      end

      private

      attr_writer :value, :votes, :timebox
    end
  end
end
