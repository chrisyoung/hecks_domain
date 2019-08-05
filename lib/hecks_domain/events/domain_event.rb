class HecksDomain
  module Events
    class DomainEvent
      attr_reader :name, :command, :args, :head
      def initialize(command)
        @command = command
        @head = @command.head
        @name = command.class.to_s.underscore
        @args = command.args
      end
    end
  end
end
