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
              @discussing = @discussion_list.instance_eval do
                @positions.compact!
                @positions.delete(@positions.first).discussion
              end
            end

            self
          end
        end
      end
    end
  end
end
