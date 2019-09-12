module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Commands
          class StartVoting
            attr_reader :args, :root

            def initialize(meeting)
              @meeting = meeting
              @root = meeting
            end

            def call
              @meeting.instance_eval { @phase = :voting }
              Meeting::MeetingTimer.start(@meeting.timebox.voting_duration, @meeting)
              self
            end
          end
        end
      end
    end
  end
end
