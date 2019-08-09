class HecksDomain
  module Commands
    module CommandRunner
      def self.run(command, &block)
        command.call
        Events::DomainEventPublisher.emit(command, &block)
        command
      end
    end
  end
end
