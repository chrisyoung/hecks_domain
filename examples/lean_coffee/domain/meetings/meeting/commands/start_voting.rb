module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class StartVoting
          attr_reader :args, :head

          def initialize(meeting)
            @meeting = meeting
            @head = meeting
          end

          def call
            @meeting.instance_eval { @phase = :voting }
            Meeting::Timer.start(@meeting.timebox.voting_duration, @meeting)
            self
          end
        end
      end
    end
  end
end

