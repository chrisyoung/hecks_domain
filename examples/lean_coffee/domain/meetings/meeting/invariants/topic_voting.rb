module LeanCoffee
  module Meetings
    class Meeting
      module Invariants
        module TopicVoting
          def invariant_test_participants_can_only_vote_for_a_topic_once(command)
            return if @participants.empty?
            
            @participants.each do |p|
              if p.topic_votes != p.topic_votes.uniq
                command.rollback if command.respond_to?(:rollback)
                raise "#{p.name} voted for the same topic twice!"
              end
            end
          end
        end
      end
    end
  end
end
