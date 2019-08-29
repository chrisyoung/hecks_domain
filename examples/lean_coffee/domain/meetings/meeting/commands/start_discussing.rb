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
            @head.instance_eval do
              @phase = :discussing
            end

            @head.discuss_next_topic!

            self
          end
        end
      end
    end
  end
end

