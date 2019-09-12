module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Commands
          class MoveTopicToTop
            attr_reader :args, :root

            def initialize(meeting, topic)
              @meeting = meeting
              @root = meeting
              @topic = topic
            end

            def call
              topic_to_find = @topic
              @root.discussion.instance_eval do
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

end