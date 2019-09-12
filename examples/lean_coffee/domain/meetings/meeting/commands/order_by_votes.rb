module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Commands
          class OrderByVotes
            attr_reader :args, :root

            def initialize(meeting)
              @meeting = meeting
              @root = meeting
            end

            def call
              
              @root.discussion.instance_eval do
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
end
