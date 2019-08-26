module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class StartMeeting
          attr_reader :args, :head

          def initialize(meeting)
            @meeting = meeting
            @head = meeting
          end

          def call
            @meeting.instance_eval do
              @phase = :collecting
              @collection_timebox.instance_eval do
                @start_time = Time.now
                @end_time = @start_time + (@duration * 60)
              end
            end

            self
          end
        end
      end
    end
  end
end

