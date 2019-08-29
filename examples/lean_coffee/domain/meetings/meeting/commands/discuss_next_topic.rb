module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class DiscussNextTopic
          attr_reader :args, :head

          def initialize(meeting)
            @meeting = meeting
            @head = meeting
          end

          def call
            @head.discussion.instance_eval do
              @discussed << @discussing if @discussing
              @topics.compact!
              @discussing = @topics.delete(@topics.first)
            end


            self
          end
        end
      end
    end
  end
end
