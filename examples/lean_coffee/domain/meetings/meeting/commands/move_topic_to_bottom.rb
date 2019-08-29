module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class MoveTopicToBottom
          attr_reader :args, :head, :topic

          def initialize(meeting, topic)
            @meeting = meeting
            @head = meeting
            @topic = topic
          end

          def call
            @meeting.discussion.move_topic_to_bottom!(@topic)

            self
          end
        end
      end
    end
  end
end
