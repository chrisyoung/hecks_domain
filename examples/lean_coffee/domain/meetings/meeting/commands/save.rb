module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class Save
          attr_reader :args, :head

          def initialize(head)
            @head = head
          end

          def call
            @id = @head.class::Repository.save(@head)
            self
          end
        end
      end
    end
  end
end

