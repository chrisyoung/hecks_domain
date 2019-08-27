module LeanCoffee
  module Meetings
    class Meeting
      module Invariants
        module Phases
          COLLECTING_COMMANDS = [
            LeanCoffee::Meetings::Meeting::Commands::AddDiscussion
          ].freeze

          VOTING_COMMANDS = [].freeze
          ORDERING_COMMANDS = [].freeze
          DISCUSSING_COMMANDS = [].freeze

          def invariant_test_foo(command)
            case phase
            when :collecting
              # do nothing
            else
              return unless COLLECTING_COMMANDS.include? command.class

              raise 'Must be in collection phase to add a discussion'
            end
          end
        end
      end
    end
  end
end
