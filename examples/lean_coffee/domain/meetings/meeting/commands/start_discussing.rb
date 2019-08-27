module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class StartDiscussing
          attr_reader :args, :head

          def initialize(meeting)
            @meeting = meeting
            @head = meeting
          end

          def call
            @meeting.instance_eval do
              @phase = :discussing
            end

            self
          end
        end
      end
    end
  end
end

