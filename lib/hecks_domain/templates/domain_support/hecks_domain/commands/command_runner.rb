class HecksDomain
  module Commands
    module CommandRunner
      def self.run(command, &block)
        command.head.test_invariants(command)
        command.call
        Events::DomainEventPublisher.emit(command, &block)
        command
      end
    end
  end
end
