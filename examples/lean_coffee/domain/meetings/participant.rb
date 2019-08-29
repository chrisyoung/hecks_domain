['factories'].each do |name|
  Dir[File.dirname(__FILE__) + "/participant/#{name}/*.rb"].each { |file| require_relative file }
end


module LeanCoffee
  module Meetings
    class Participant
      include HecksDomain::Factories::FactoryLoader
      

      attr_reader :name, :remaining_votes

      def initialize(name:, remaining_votes:, topic_votes: [])
        @name = name
        @remaining_votes = remaining_votes
        @topic_votes = topic_votes
      end

      def topic_votes
        @topic_votes.clone.freeze
      end

      private

      attr_writer :name, :remaining_votes, :topic_votes
    end
  end
end
