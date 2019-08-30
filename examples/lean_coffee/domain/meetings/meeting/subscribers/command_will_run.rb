module LeanCoffee
  module Meetings
    class Meeting
      module Subscribers
        class CommandWillRun
          def self.domain_event
            LeanCoffee::Events::CommandWillRun
          end

          def self.notify(event)
            return unless event.head
            return unless event.head.class == LeanCoffee::Meetings::Meeting

            Services::StateMachine.new(event.head).verify!(event.command.command_to_run)
          end

          HecksDomain::Events::DomainEventPublisher.subscribe(self)
        end
      end
    end
  end
end
