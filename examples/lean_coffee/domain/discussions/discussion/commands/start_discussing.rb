module LeanCoffee
  module Discussions
    class Discussion
      module Commands
        class StartDiscussing
          attr_reader :args, :head

          def initialize(head)
            @head = head
            @head = head
          end

          def call
            @head.instance_eval { @phase = :discussing }
            @head.discuss_next_topic!
            self
          end
        end
      end
    end
  end
end

