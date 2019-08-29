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
            puts "keep talking!"
            self
          end
        end
      end
    end
  end
end

