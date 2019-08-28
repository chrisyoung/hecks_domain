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
            @meeting.instance_eval do
              @discussions.sort! do |discussion1, discussion2|
                discussion1.votes <=> discussion2.votes
              end.reverse!
            end

            self
          end
        end
      end
    end
  end
end

