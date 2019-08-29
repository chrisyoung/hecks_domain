module LeanCoffee
  module Meetings
    class Meeting
      module Invariants
        module Phases
          COLLECTING = [Commands::AddTopic].freeze
          VOTING = [Commands::Vote].freeze
          ORDERING = [
            Commands::MoveTopicToTop,
            Commands::MoveTopicToBottom,
            Commands::OrderByVotes
          ].freeze
          DISCUSSING = [
            Commands::DiscussNextTopic,
            Commands::KeepTalking
          ].freeze
          DISCUSSING_TOPIC = [

          ]
          WAITING_FOR_EXTENSION_VOTE = [
            Commands::VoteToKeepTalking,
            Commands::VoteToStopTalking,
            Commands::KeepTalking,
            Commands::DiscussNextTopic
          ].freeze

          ALL = COLLECTING + VOTING + ORDERING + DISCUSSING +
                WAITING_FOR_EXTENSION_VOTE + DISCUSSING_TOPIC

          def invariant_test_waiting_for_extension_vote_phase(command)
            return unless phase == :waiting_for_extension_vote
            return unless (ALL - WAITING_FOR_EXTENSION_VOTE).include?(command.class)

            raise wrong_phase_error(WAITING_FOR_EXTENSION_VOTE)
          end

          def invariant_test_discussing_topic(command)
            return unless phase == :discussing_topic
            return unless (ALL - DISCUSSING_TOPIC).include?(command.class)

            raise wrong_phase_error(DISCUSSING_TOPIC)
          end

          def invariant_test_collecting_phase(command)
            return unless phase == :collecting
            return unless (ALL - COLLECTING).include?(command.class)

            raise wrong_phase_error(COLLECTING)
          end

          def invariant_test_ordering_phase(command)
            return unless phase == :ordering
            return unless (ALL - ORDERING).include?(command.class)

            raise wrong_phase_error(ORDERING)
          end

          def invariant_test_voting_phase(command)
            return unless phase == :voting
            return unless (ALL - VOTING).include?(command.class)

            raise wrong_phase_error(VOTING)
          end

          def invariant_test_discussing_phase(command)
            return unless phase == :discussing
            return unless (ALL - DISCUSSING).include?(command.class)

            raise wrong_phase_error(DISCUSSING)
          end

          def invariant_test_no_phase(command)
            return unless phase.nil? || phase == :waiting
            return unless ALL.include?(command.class)

            raise 'Waiting to choose a phase'
          end

          private

          def wrong_phase_error(commands, command=nil)
            raise "In #{phase} phase. Valid Commands are: " +
                  commands.map {|command| '#' + command.to_s.split('::').last.underscore}.join(', ')
          end
        end
      end
    end
  end
end
