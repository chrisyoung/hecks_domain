module LeanCoffee
  module Discussions
    class Discussion
      module Commands
        class AddTopic
          attr_reader :args, :head

          def initialize(head, topic)
            @head = head
            @topic = topic
          end

          def call
            topic = @topic
            head.instance_eval do
              @topics << topic
            end
            self
          end
        end
      end
    end
  end
end

