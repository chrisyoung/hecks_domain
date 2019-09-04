class Support
  module Events
    class DomainEvent
      attr_reader :type, :name, :command, :args, :head
      def initialize(command)
        @command = command
        @head = @command.head
        @type = @command.class
        @name = @type.to_s.underscore
        @args = command.args
      end
    end
  end
end
