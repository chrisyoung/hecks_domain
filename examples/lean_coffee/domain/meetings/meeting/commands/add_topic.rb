module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class AddTopic
          attr_reader :args, :head

          def initialize(meeting, topic)
            @head = meeting
            @meeting = meeting
            @topic = topic
          end

          def call
            topic = @topic
            @head.discussion.add_topic!(topic)
            self
          end
        end
      end
    end
  end
end