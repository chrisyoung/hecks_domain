module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Commands
          class MoveTopicToBottom
            attr_reader :args, :root, :topic

            def initialize(meeting, topic)
              @meeting = meeting
              @root = meeting
              @topic = topic
            end

            def call
              topic_to_find = @topic
              @root.discussion.instance_eval do
                for_bottom = @topics.find do |topic|
                  topic_to_find == topic
                end

                @topics.insert(-1, @topics.delete(for_bottom))
              end


              self
            end
          end
        end
      end
    end
  end
end