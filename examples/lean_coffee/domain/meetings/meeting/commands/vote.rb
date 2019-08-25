module LeanCoffee
  module Meetings
    class Meeting
      module Commands
        class Vote
          attr_reader :args, :head

          def initialize(meeting, participant:, topic:)
            @meeting = meeting
            @discussion_list = @meeting.discussion_list
            @participant = participant
            @topic = topic
          end

          def call
            discussion_list = @discussion_list
            topic = @topic
            
            @participant.instance_eval do
              @remaining_votes -= 1

              discussion_to_vote_for = discussion_list.positions.find do |discussion_position|
                discussion_position.discussion.topic == topic
              end.discussion

              discussion_to_vote_for
            end
            
            self
          end
        end
      end
    end
  end
end

