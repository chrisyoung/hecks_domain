module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        class Services
          class SimpleStateMachine
            STATE_COMMANDS = {
              collecting: [Commands::AddTopic],
              voting: [Commands::Vote].freeze,
              ordering: [
                Commands::MoveTopicToTop,
                Commands::MoveTopicToBottom,
                Commands::OrderByVotes
              ],
              discussing: [
                Commands::DiscussNextTopic,
                Commands::KeepTalking
              ],
              discussing_topic: [],
              waiting: [],
              waiting_for_extension_vote: [
                Commands::VoteToKeepTalking,
                Commands::VoteToStopTalking,
                Commands::KeepTalking,
                Commands::DiscussNextTopic
              ]
            }.freeze

            def initialize(meeting)
              @meeting = meeting
            end

            def verify!(command)
              STATE_COMMANDS.each do |phase, commands|
                next unless @meeting.phase == phase
                next unless (all_commands - STATE_COMMANDS[phase]).include?(command.class)

                raise wrong_phase_error(commands)
              end
            end

            private

            def all_commands
              STATE_COMMANDS.values.flatten
            end

            def command_string(commands)
              return '' if commands.empty?

              ' Valid Commands are: ' + commands.map do |command|
                '#' + command.to_s.split('::').last.underscore
              end.join(', ')
            end

            def wrong_phase_error(commands)
              raise "In #{@meeting.phase} phase." + command_string(commands)
            end
          end
        end
      end
    end
  end
end