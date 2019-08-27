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
              @collection_timebox.instance_eval do
                @start_time = Time.now
                @end_time = @start_time + (@duration * 60)
                Meeting::Timer.start(@duration, head)
              end
            end
            self
          end
        end
      end
    end
  end
end
