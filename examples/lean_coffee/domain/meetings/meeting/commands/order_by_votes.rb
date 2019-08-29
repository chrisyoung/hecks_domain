module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class OrderByVotes
          attr_reader :args, :head

          def initialize(meeting)
            @meeting = meeting
            @head = meeting
          end

          def call
            @meeting.discussion.order_by_votes!
            # @meeting.instance_eval do
            #   @topics.sort! do |topic1, topic2|
            #     topic1.votes <=> topic2.votes
            #   end.reverse!
            # end
            self
          end
        end
      end
    end
  end
end

