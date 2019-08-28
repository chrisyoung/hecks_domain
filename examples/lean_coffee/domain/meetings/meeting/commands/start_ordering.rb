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
            Meeting::Timer.start(@meeting.ordering_timebox.duration, @meeting)
            self
          end
        end
      end
    end
  end
end
