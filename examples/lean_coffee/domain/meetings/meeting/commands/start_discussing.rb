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
            @meeting.instance_eval { @phase = :discussing }
            @meeting.discuss_next_topic!
            self
          end
        end
      end
    end
  end
end

