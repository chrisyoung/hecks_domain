module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class MoveDiscussionToTop
          attr_reader :args, :head

          def initialize(meeting, discussion)
            @meeting = meeting
            @head = meeting
            @discussion = discussion
          end

          def call
            discussion_to_find = @discussion
            @meeting.instance_eval do
              for_top = @discussions.find do |discussion|
                discussion_to_find == discussion
              end

              @discussions.insert(0, @discussions.delete(for_top))
            end

            self
          end
        end
      end
    end
  end
end
