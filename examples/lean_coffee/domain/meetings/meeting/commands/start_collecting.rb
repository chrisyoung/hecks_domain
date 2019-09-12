module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Commands
          class StartCollecting
            attr_reader :args, :root

            def initialize(meeting)
              @meeting = meeting
              @root = meeting
            end

            def call
              @meeting.instance_eval { @phase = :collecting }
              Meeting::MeetingTimer.start(@meeting.timebox.collection_duration, @meeting)
              self
            end
          end
        end
      end
    end
  end
end