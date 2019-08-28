module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class Vote
          attr_reader :args, :head

          def initialize(meeting, participant:, discussion:)
            @head = meeting
            @meeting = meeting
            @participant = participant
            @discussion = discussion
          end

          def call
            @participant.instance_eval { @remaining_votes -= 1 }
            @discussion.instance_eval { @votes += 1 }
            self
          end
        end
      end
    end
  end
end

