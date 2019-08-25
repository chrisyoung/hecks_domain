module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class MoveDiscussionToBottom
          attr_reader :args, :head, :discussion

          def initialize(meeting, discussion)
            @meeting = meeting
            @head = meeting
            @discussion = discussion
          end

          def call
            discussion = discussion

            @meeting.discussion_list.instance_eval do
              @positions << @positions.delete(@positions.find do |position|
                position.discussion == discussion
              end)
            end

            self
          end
        end
      end
    end
  end
end
