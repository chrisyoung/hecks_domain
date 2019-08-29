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
            topic_to_find = @topic
            @head.discussion.instance_eval do
              for_top = @topics.find do |topic|
                topic_to_find == topic
              end

              @topics.insert(0, @topics.delete(for_top))
            end


            self
          end
        end
      end
    end
  end
end
