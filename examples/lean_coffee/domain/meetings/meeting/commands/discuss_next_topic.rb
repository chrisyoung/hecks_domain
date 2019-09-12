module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Commands
          class DiscussNextTopic
            attr_reader :args, :root

            def initialize(meeting)
              @meeting = meeting
              @root = meeting
            end

            def call
              TopicDiscussionTimer.start(@meeting)

              @root.discussion.instance_eval do
                @discussed << @discussing if @discussing
                @topics.compact!
                @discussing = @topics.delete(@topics.first)
              end

              @root.instance_eval do
                @phase = :discussing_topic
              end

              self
            end
          end
        end
      end
    end
  end
end