module LeanCoffee
  module Discussions
    class Discussion
      module Commands
        class MoveTopicToTop
          attr_reader :args, :head

          def initialize(head, topic)
            @head = head
            @topic = topic
          end

          def call
            topic_to_find = @topic
            @head.instance_eval do
              for_top = @topics.find do |topic|
                topic_to_find == topic
              end

              @topics.insert(0, @topics.delete(for_top))
            end

            self
          end
        end
      end
    end
  end
end
