module LeanCoffee
  module Meetings
    class Meeting
      module Invariants
        module Phases
          COLLECTING = [Commands::AddDiscussion].freeze
          VOTING = [Commands::Vote].freeze
          ORDERING = [Commands::MoveDiscussionToTop,
                      Commands::MoveDiscussionToBottom,
                      Commands::OrderByVotes].freeze
          DISCUSSING = [Commands::DiscussNextTopic].freeze

          ALL = COLLECTING + VOTING + ORDERING + DISCUSSING

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

          def wrong_phase_error(commands)
            raise "In #{phase} phase. Valid Commands are: " +
                  commands.map {|command| '#' + command.to_s.split('::').last.underscore}.join(', ')
          end
        end
      end
    end
  end
end
