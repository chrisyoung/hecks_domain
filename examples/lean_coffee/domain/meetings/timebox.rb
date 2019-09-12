module LeanCoffee
  module Domain
    module Meetings
      class Timebox
        
        include Support::DomainObject

        attr_reader :voting_duration, :collection_duration, :ordering_duration, :topic_discussion_duration, :topic_extension_duration

        def initialize(voting_duration:, collection_duration:, ordering_duration:, topic_discussion_duration:, topic_extension_duration:)
          @voting_duration = voting_duration
          @collection_duration = collection_duration
          @ordering_duration = ordering_duration
          @topic_discussion_duration = topic_discussion_duration
          @topic_extension_duration = topic_extension_duration
        end

        private

        attr_writer :voting_duration, :collection_duration, :ordering_duration, :topic_discussion_duration, :topic_extension_duration
      end
    end
  end
end
