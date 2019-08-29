class HecksDomain
  module Commands
    module CommandRunner
      def self.run(command, &block)
        command.head.test_invariants(command)
        command.call
        # command.head.test_invariants(command)
        Events::DomainEventPublisher.emit(command, &block)
        command
      end
    end
  end
end
