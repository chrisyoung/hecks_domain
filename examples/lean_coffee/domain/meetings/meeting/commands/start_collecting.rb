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
            head = @head
            @meeting.instance_eval do
              @phase = :collecting
              Meeting::Timer.start(@collection_timebox.duration, head)
            end
            self
          end
        end
      end
    end
  end
end
