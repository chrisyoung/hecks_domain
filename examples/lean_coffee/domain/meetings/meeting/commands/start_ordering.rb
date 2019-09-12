module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Commands
          class StartOrdering
            attr_reader :args, :root

            def initialize(meeting)
              @meeting = meeting
              @root = meeting
            end

            def call
              @meeting.instance_eval { @phase = :ordering }
              Meeting::MeetingTimer.start(@meeting.timebox.ordering_duration, @meeting)
              self
            end
          end
        end
      end
    end
  end
end