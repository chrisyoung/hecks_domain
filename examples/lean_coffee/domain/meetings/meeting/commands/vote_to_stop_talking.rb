module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Commands
          class VoteToStopTalking
            attr_reader :args, :root

            def initialize(root, participant)
              @root = root
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
end
