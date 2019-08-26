module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class Vote
          attr_reader :args, :head

          def initialize(meeting, participant:, discussion:)
            @head = meeting
            @meeting = meeting
            @discussion_list = @meeting.discussion_list
            @participant = participant
            @discussion = discussion
          end

          def call
            discussion = @discussion
            head = @head

            @participant.instance_eval do
              raise 'Must be in voting phase to add a vote' if head.phase != :voting

              @remaining_votes -= 1

              discussion.instance_eval do
                @votes += 1
              end
            end

            self
          end
        end
      end
    end
  end
end

