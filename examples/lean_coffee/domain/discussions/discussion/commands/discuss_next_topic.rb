module LeanCoffee
  module Discussions
    class Discussion
      module Commands
        class DiscussNextTopic
          attr_reader :args, :head

          def initialize(head)
            @head = head
          end

          def call
            @head.instance_eval do
              @discussed << @discussing if @discussing
              @topics.compact!
              @discussing = @topics.delete(@topics.first)
            end

            self
          end
        end
      end
    end
  end
end
