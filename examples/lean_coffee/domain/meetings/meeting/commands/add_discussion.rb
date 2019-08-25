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
            head = @head

            @discussion_list.instance_eval do
              raise 'Must be in collection phase to add a discussion' unless head.phase == :collecting
              @positions << position
            end

            self
          end
        end
      end
    end
  end
end

