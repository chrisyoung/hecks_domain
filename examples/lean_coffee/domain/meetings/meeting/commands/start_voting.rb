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
            head = @head
            @meeting.instance_eval do
              @phase = :voting
              Meeting::Timer.start(@voting_timebox.duration, head)
            end

            self
          end
        end
      end
    end
  end
end

