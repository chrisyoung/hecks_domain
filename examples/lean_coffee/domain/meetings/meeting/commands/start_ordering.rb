module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class StartOrdering
          attr_reader :args, :head

          def initialize(meeting)
            @meeting = meeting
            @head = meeting
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
