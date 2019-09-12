module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Commands
          class AddTopic
            attr_reader :args, :root

            def initialize(meeting, topic)
              @root = meeting
              @meeting = meeting
              @topic = topic
            end

            def call
              topic = @topic
              topic = @topic
              root.discussion.instance_eval do
                @topics << topic
              end
              self
            end
          end
        end
      end
    end
  end
end