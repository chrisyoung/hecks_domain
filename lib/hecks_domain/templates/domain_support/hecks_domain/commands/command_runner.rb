class HecksDomain
  module Commands
    module CommandRunner
      def self.run(command, &block)
        Events::DomainEventPublisher.emit(
          SoccerSeason::Events::CommandWillRun.new(command), &block
        )

        command.call
        command.head.test_invariants(command)
        Events::DomainEventPublisher.emit(command, &block)
        command
      end
    end
  end
end
