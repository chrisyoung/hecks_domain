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
            @meeting.instance_eval do
              @phase = :ordering
            end

            self
          end
        end
      end
    end
  end
end
