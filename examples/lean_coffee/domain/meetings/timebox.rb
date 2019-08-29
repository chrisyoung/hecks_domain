['factories'].each do |name|
  Dir[File.dirname(__FILE__) + "/timebox/#{name}/*.rb"].each { |file| require_relative file }
end


module LeanCoffee
  module Meetings
    class Timebox
      include HecksDomain::Factories::FactoryLoader
      

      attr_reader :voting_duration, :collection_duration, :ordering_duration, :topic_discussion_duration

      def initialize(voting_duration:, collection_duration:, ordering_duration:, topic_discussion_duration:)
        @voting_duration = voting_duration
        @collection_duration = collection_duration
        @ordering_duration = ordering_duration
        @topic_discussion_duration = topic_discussion_duration
      end

      private

      attr_writer :voting_duration, :collection_duration, :ordering_duration, :topic_discussion_duration
    end
  end
end
