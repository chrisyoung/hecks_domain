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
            head = @head
            @meeting.instance_eval do
              @phase = :ordering
              Meeting::Timer.start(@ordering_timebox.duration, head)
            end

            self
          end
        end
      end
    end
  end
end
