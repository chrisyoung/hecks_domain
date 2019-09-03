module SoccerSeason
  module Events
    class CommandWillRun
      attr_reader :head, :args, :command_to_run
      def initialize(command)
        @head = command.head
        @command_to_run = command
      end
    end
  end
end

