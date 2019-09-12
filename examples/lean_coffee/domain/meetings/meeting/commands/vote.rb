module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Commands
          class Vote
            attr_reader :args, :root

            def initialize(meeting, participant:, topic:)
              @root = meeting
              @meeting = meeting
              @participant = participant
              @topic = topic
            end

            def call
              @participant.instance_eval { @remaining_votes -= 1 }
              @topic.instance_eval { @votes += 1 }
              self
            end
          end
        end
      end
    end
  end
end
