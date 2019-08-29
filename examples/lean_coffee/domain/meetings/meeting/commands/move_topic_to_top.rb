module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class MoveTopicToTop
          attr_reader :args, :head

          def initialize(meeting, topic)
            @meeting = meeting
            @head = meeting
            @topic = topic
          end

          def call
            @head.discussion.move_topic_to_top!(@topic)

            self
          end
        end
      end
    end
  end
end
