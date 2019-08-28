module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class AddDiscussion
          attr_reader :args, :head

          def initialize(meeting, discussion)
            @head = meeting
            @meeting = meeting
            @discussions = @meeting.discussions
            @discussion = discussion
          end

          def call
            discussion = @discussion

            @head.instance_eval do
              @discussions << discussion
            end

            self
          end
        end
      end
    end
  end
end