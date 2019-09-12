module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Commands
          class VoteToKeepTalking
            attr_reader :args, :root

            def initialize(root, participant)
              @root = root
              @participant = participant[:participant]
            end

            def rollback
              root = @root
              @participant.instance_eval do
                @topic_votes.delete(root.discussion.discussing)
              end
              self
            end

            def call
              root = @root
              @participant.instance_eval do
                @topic_votes << root.discussion.discussing
              end
              self
            end
          end
        end
      end
    end
  end
end
