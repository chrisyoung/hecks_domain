module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class VoteToKeepTalking
          attr_reader :args, :head

          def initialize(head, participant)
            @head = head
            @participant = participant
          end

          def call
            puts "vote to keep talking"
            self
          end
        end
      end
    end
  end
end

