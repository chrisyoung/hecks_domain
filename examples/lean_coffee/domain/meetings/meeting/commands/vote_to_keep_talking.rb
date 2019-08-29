module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class VoteToKeepTalking
          attr_reader :args, :head

          def initialize(head, participant)
            @head = head
            @participant = participant[:participant]
            
          end

          def rollback
            head = @head
            @participant.instance_eval do
              @topic_votes.delete(head.discussion.discussing)
            end
            self
          end

          def call
            head = @head
            @participant.instance_eval do
              @topic_votes << head.discussion.discussing
            end
            self
          end
        end
      end
    end
  end
end

