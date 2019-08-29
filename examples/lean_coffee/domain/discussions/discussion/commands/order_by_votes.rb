module LeanCoffee
  module Discussions
    class Discussion
      module Commands
        class OrderByVotes
          attr_reader :args, :head

          def initialize(head)
            @head = head
          end

          def call
            @head.instance_eval do
              @topics.sort! do |topic1, topic2|
                topic1.votes <=> topic2.votes
              end.reverse!
            end
            self
          end
        end
      end
    end
  end
end

