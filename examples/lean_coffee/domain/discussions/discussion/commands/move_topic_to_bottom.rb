module LeanCoffee
  module Discussions
    class Discussion
      module Commands
        class MoveTopicToBottom
          attr_reader :args, :head

          def initialize(head, topic)
            @head = head
            @topic = topic
          end

          def call
            topic_to_find = @topic
            @head.instance_eval do
              for_bottom = @topics.find do |topic|
                topic_to_find == topic
              end

              @topics.insert(-1, @topics.delete(for_bottom))
            end

            self
          end
        end
      end
    end
  end
end
