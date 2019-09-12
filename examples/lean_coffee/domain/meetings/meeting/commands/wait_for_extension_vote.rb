module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Commands
          class WaitForExtensionVote
            attr_reader :args, :root

            def initialize(meeting)
              @meeting = meeting
              @root = meeting
            end

            def call
              @meeting.instance_eval { @phase = :waiting_for_extension_vote }
              self
            end
          end
        end
      end
    end
  end
end