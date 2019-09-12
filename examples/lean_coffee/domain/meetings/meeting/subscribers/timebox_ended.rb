module LeanCoffee
  module Meetings
    class Meeting
      module Subscribers
        class TimeboxEnded
          def self.domain_event
            LeanCoffee::Domain::Meetings::Meeting::Events::TimeboxEnded
          end

          def self.notify(event)
            event.root.wait_for_next_phase!
          end

          Support::Events::DomainEventPublisher.subscribe(self)
        end
      end
    end
  end
end
