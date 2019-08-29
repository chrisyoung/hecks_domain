module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class KeepTalking
          attr_reader :args, :head

          def initialize(head)
            @head = head
          end

          def call
            ExtensionTimer.start(@head)
            @head.instance_eval do
              @phase = :discussing_topic
            end
            self
          end
        end
      end
    end
  end
end

