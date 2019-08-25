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
            @meeting.discussion_list.instance_eval do
              @positions.sort! do |position1, position2|
                position1.discussion.votes <=> position2.discussion.votes
              end.reverse!
            end

            self
          end
        end
      end
    end
  end
end

