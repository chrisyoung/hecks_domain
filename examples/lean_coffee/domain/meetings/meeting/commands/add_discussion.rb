module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class AddDiscussion
          attr_reader :args, :head

          def initialize(meeting, discussion)
            @head = meeting
            @meeting = meeting
            @discussion_list = @meeting.discussion_list
            @discussion = discussion
          end

          def call
            discussion = @discussion
            position = LeanCoffee::Meetings::Position.new(
              discussion: discussion
            )
            phase = @head.phase

            @discussion_list.instance_eval do
              @positions << position
            end

            self
          end
        end
      end
    end
  end
end