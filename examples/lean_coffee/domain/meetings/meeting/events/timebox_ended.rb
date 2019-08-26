module LeanCoffee
  module Meetings
    class Meeting
      module Events
        class TimeboxEnded
          attr_reader :head, :args
          def initialize(head:, args:)
            @head = head
            @args = args
          end
        end
      end
    end
  end
end