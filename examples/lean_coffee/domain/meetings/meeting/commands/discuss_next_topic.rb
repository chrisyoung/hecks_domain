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
            @meeting.instance_eval do
              @discussed << @discussing if @discussing
              @discussions.compact!
              @discussing = @discussions.delete(@discussions.first)
            end

            self
          end
        end
      end
    end
  end
end
