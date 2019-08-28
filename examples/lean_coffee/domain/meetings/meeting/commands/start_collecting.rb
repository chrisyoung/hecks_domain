module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class StartCollecting
          attr_reader :args, :head

          def initialize(meeting)
            @meeting = meeting
            @head = meeting
          end

          def call
            @meeting.instance_eval { @phase = :collecting }
            Meeting::Timer.start(@meeting.collection_timebox.duration, @meeting)
            self
          end
        end
      end
    end
  end
end
