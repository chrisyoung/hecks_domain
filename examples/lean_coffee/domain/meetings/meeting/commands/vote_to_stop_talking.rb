module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class VoteToStopTalking
          attr_reader :args, :head

          def initialize(head, participant)
            @head = head
            @participant = participant
          end

          def call
            self
          end
        end
      end
    end
  end
end

