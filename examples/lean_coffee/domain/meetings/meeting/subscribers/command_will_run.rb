module LeanCoffee
  module Domain
    module Meetings
      class Meeting
        module Subscribers
          class CommandWillRun
            def self.domain_event
              LeanCoffee::Events::CommandWillRun
            end

            def self.notify(event)
              # require 'pry'; binding.pry
              return unless event.root
              return unless event.root.class == LeanCoffee::Domain::Meetings::Meeting

              Services::SimpleStateMachine.new(event.root).verify!(event.command.command_to_run)
            end

            Support::Events::DomainEventPublisher.subscribe(self)
          end
        end
      end
    end
  end
end