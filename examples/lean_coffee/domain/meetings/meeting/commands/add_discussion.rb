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

            @discussion_list.instance_exec self do
              @positions << LeanCoffee::Meetings::Position.new(
                discussion: discussion
              )
            end

            self
          end
        end
      end
    end
  end
end