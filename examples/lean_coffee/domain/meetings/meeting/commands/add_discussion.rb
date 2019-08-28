module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class AddTopic
          attr_reader :args, :head

          def initialize(meeting, topic)
            @head = meeting
            @meeting = meeting
            @topics = @meeting.topics
            @topic = topic
          end

          def call
            topic = @topic

            @head.instance_eval do
              @topics << topic
            end

            self
          end
        end
      end
    end
  end
end